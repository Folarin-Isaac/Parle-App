import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/ui/counsellor/widgets/uploaded_document_item.dart';

class UploadCredentialsScreen extends StatefulWidget {
  const UploadCredentialsScreen({super.key});

  @override
  State<UploadCredentialsScreen> createState() => _UploadCredentialsScreenState();
}

class _UploadCredentialsScreenState extends State<UploadCredentialsScreen> {
  String? _selectedDocumentType = 'Resume';
  String? _selectedFileName;
  final List<Map<String, String>> _uploadedDocuments = [];
  final TextEditingController _aboutController = TextEditingController();

  final List<String> _documentTypes = [
    'Resume',
    'First Degree Certificate',
    'Second Degree Certificate',
    'Professional License',
    'Training Certificate',
    'Other',
  ];

  void _selectFile() {
    // TODO: Implement file picker with file_picker package
    // import 'package:file_picker/file_picker.dart';
    //
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
    // );
    //
    // if (result != null) {
    //   setState(() {
    //     // Get filename without extension for cleaner display
    //     String fullName = result.files.single.name;
    //     _selectedFileName = fullName.split('.').first;
    //     // Or keep extension: _selectedFileName = fullName;
    //   });
    // }

    // For demo: simulate file selection
    setState(() {
      _selectedFileName = 'First Degree Certificate'; // Change to test different files
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('File selected: $_selectedFileName')),
    );

    print('Select file tapped');
  }

  void _uploadFile() {
    // Validation
    if (_selectedFileName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a file first'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_selectedDocumentType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a document type'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Add document to uploaded list - using FILENAME not document type
    setState(() {
      _uploadedDocuments.add({
        'name': _selectedFileName!, // ✅ Filename appears in the list
        'type': _selectedDocumentType!, // Store type for reference
        'path': _selectedFileName!,
      });

      // Clear selections after upload
      _selectedFileName = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('File uploaded successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _viewDocument(int index) {
    // TODO: Implement document viewer
    final document = _uploadedDocuments[index];
    print('View document: ${document['name']} (${document['type']}) at ${document['path']}');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening: ${document['name']}')),
    );
  }

  void _deleteDocument(int index) {
    final documentName = _uploadedDocuments[index]['name'];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Document'),
        content: Text('Are you sure you want to delete "$documentName"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _uploadedDocuments.removeAt(index);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$documentName deleted')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _submit() {
    if (_uploadedDocuments.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload at least one document'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (_aboutController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter information in the About section'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // TODO: Implement submit logic
    print('About: ${_aboutController.text}');
    print('Documents: $_uploadedDocuments');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Credentials submitted successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    _aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkBackground : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(AppSizes.size16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: theme.iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.size24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'Upload Credentials/CV',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Gap(AppSizes.size32),

                    // Document Type Label
                    Text(
                      'Document',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Gap(AppSizes.size12),

                    // Document Type Dropdown
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.size16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isDarkMode
                              ? AppColors.darkBorder
                              : Colors.grey[300]!,
                        ),
                        borderRadius: BorderRadius.circular(AppSizes.radius8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedDocumentType,
                          isExpanded: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: theme.iconTheme.color,
                          ),
                          items: _documentTypes.map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(
                                type,
                                style: theme.textTheme.bodyMedium,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedDocumentType = newValue;
                            });
                          },
                        ),
                      ),
                    ),

                    Gap(AppSizes.size24),

                    // Select File Button
                    Align(
                      alignment: Alignment.centerRight,
                      child: OutlinedButton(
                        onPressed: _selectFile,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: isDarkMode
                                ? AppColors.darkBorder
                                : Colors.grey[300]!,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.radius8),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.size24,
                            vertical: AppSizes.size12,
                          ),
                        ),
                        child: Text(
                          'Select File',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      ),
                    ),

                    if (_selectedFileName != null) ...[
                      Gap(AppSizes.size8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Selected: $_selectedFileName',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],

                    Gap(AppSizes.size16),

                    // Upload File Button
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: _uploadFile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode
                              ? AppColors.darkPrimary
                              : const Color(0xFFFDB827),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.radius8),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes.size12,
                          ),
                        ),
                        child: Text(
                          'Upload File',
                          style: TextStyle(
                            color: isDarkMode ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    Gap(AppSizes.size32),

                    // Documents Uploaded Section
                    Text(
                      'Documents Uploaded',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Gap(AppSizes.size16),

                    // Uploaded Documents List or Empty State
                    if (_uploadedDocuments.isEmpty)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSizes.size24),
                          child: Text(
                            'No documents uploaded yet',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodySmall?.color,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      )
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _uploadedDocuments.length,
                        separatorBuilder: (context, index) => Gap(AppSizes.size16),
                        itemBuilder: (context, index) {
                          final document = _uploadedDocuments[index];
                          return UploadedDocumentItem(
                            documentName: document['name']!,
                            onView: () => _viewDocument(index),
                            onDelete: () => _deleteDocument(index),
                          );
                        },
                      ),

                    Gap(AppSizes.size32),

                    // About Section
                    Text(
                      'About Halima',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Gap(AppSizes.size12),

                    // About TextField
                    Container(
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? AppColors.darkSecondaryBackground
                            : const Color(0xFFFFF8E1), // Light cream
                        borderRadius: BorderRadius.circular(AppSizes.radius8),
                      ),
                      child: TextField(
                        controller: _aboutController,
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: 'Enter a brief summary on your profession as a counsellor',
                          hintStyle: theme.textTheme.bodySmall?.copyWith(
                            color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSizes.radius8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.all(AppSizes.size16),
                        ),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),

                    Gap(AppSizes.size80), // Space for FAB
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: _submit,
        backgroundColor: isDarkMode
            ? AppColors.darkPrimary
            : const Color(0xFFFDB827),
        shape: const CircleBorder(),
        child: Icon(
          Icons.arrow_forward,
          color: isDarkMode ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}