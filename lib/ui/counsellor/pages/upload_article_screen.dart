import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/components/custom_button.dart';
import 'package:parle_app/components/custom_text_field.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/components/app_header.dart';
import 'package:parle_app/constants/app_strings.dart';
import 'package:parle_app/ui/counsellor/pages/article_upload_success_screen.dart';
import 'package:parle_app/ui/counsellor/widgets/content_text_field.dart';
import 'package:parle_app/ui/counsellor/widgets/file_selection_field.dart';

class UploadArticleScreen extends StatefulWidget {
  const UploadArticleScreen({super.key});

  @override
  State<UploadArticleScreen> createState() => _UploadArticleScreenState();
}

class _UploadArticleScreenState extends State<UploadArticleScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  XFile? _selectedImage;
  bool _isUploading = false;

  Future<void> _selectCoverImage() async {
    try {
      final ImageSource? source = await _showImageSourceDialog();
      if (source == null) return;
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedImage = image;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image selected: ${image.name}'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error selecting image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<ImageSource?> _showImageSourceDialog() async {
    return showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _uploadArticle() async {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter article title'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (_contentController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter article content'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a cover image'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    setState(() {
      _isUploading = true;
    });

    try {
      // TODO: Implement your actual upload logic here
      // Example:
      // final imageBytes = await _selectedImage!.readAsBytes();
      // final imageFile = File(_selectedImage!.path);
      //
      // Upload to your backend API or Firebase Storage
      // final response = await yourApiService.uploadArticle(
      //   title: _titleController.text,
      //   content: _contentController.text,
      //   coverImage: imageFile,
      // );

      // Simulate upload delay
      await Future.delayed(const Duration(seconds: 2));

      print('Title: ${_titleController.text}');
      print('Content: ${_contentController.text}');
      print('Cover Image Path: ${_selectedImage!.path}');
      print('Cover Image Name: ${_selectedImage!.name}');

      setState(() {
        _isUploading = false;
      });

      // Navigate to success screen
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ArticleUploadSuccessScreen(),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isUploading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error uploading article: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.size24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.uploadArticle,
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(AppSizes.size32),
                    CustomTextField(
                      label: AppStrings.empty,
                      hintText: AppStrings.titleOfArticle,
                      controller: _titleController,
                      useRoundedBorder: true,
                      enabled: !_isUploading,
                    ),
                    Gap(AppSizes.size16),
                    FileSelectionField(
                      selectedFileName: _selectedImage?.name,
                      placeholderText: AppStrings.selectCoverImage,
                      buttonText: AppStrings.selectFile,
                      onSelectFile: _selectCoverImage,
                      enabled: !_isUploading,
                    ),
                    if (_selectedImage != null) ...[
                      Gap(AppSizes.size16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppSizes.radius8),
                        child: Image.file(
                          File(_selectedImage!.path),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                    Gap(AppSizes.size16),
                    ContentTextField(
                      controller: _contentController,
                      hintText: AppStrings.enterText,
                      maxLines: 15,
                      enabled: !_isUploading,
                    ),
                    Gap(AppSizes.size24),
                    PrimaryButton(text: AppStrings.uploadArticle, onPressed: (){}),
                    Gap(AppSizes.size24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}