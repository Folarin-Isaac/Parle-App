import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class CredentialsContent extends StatefulWidget {
  final List<String>? areaOfExpertise;
  final List<Map<String, String>>? documents;
  final Function(List<String>?)? onAreaOfExpertiseChanged;
  final Function(List<Map<String, String>>?)? onDocumentsChanged;
  final int initialTabIndex;

  const CredentialsContent({
    super.key,
    this.areaOfExpertise,
    this.documents,
    this.onAreaOfExpertiseChanged,
    this.onDocumentsChanged,
    this.initialTabIndex = 0,
  });

  @override
  State<CredentialsContent> createState() => _CredentialsContentState();
}

class _CredentialsContentState extends State<CredentialsContent> {
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = widget.initialTabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildTabButton(
                title: 'Area of Expertise',
                index: 0,
                isSelected: _selectedTabIndex == 0,
              ),
            ),
            Gap(AppSizes.size12),
            Expanded(
              child: _buildTabButton(
                title: 'Documents',
                index: 1,
                isSelected: _selectedTabIndex == 1,
              ),
            ),
          ],
        ),

        Gap(AppSizes.size24),

        // Tab Content
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _selectedTabIndex == 0
              ? _buildAreaOfExpertiseContent()
              : _buildDocumentsContent(),
        ),
      ],
    );
  }

  Widget _buildTabButton({
    required String title,
    required int index,
    required bool isSelected,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return InkWell(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(AppSizes.radius8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.size12,
          horizontal: AppSizes.size16,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDarkMode
              ? AppColors.darkSecondaryBackground
              : const Color(0xFFFFF8E1)) // Light cream
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radius8),
          border: Border.all(
            color: isSelected
                ? (isDarkMode ? AppColors.darkBorder : Colors.grey[300]!)
                : Colors.transparent,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected
                  ? theme.textTheme.bodyMedium?.color
                  : theme.textTheme.bodySmall?.color,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAreaOfExpertiseContent() {
    final theme = Theme.of(context);

    final List<String> expertiseAreas = widget.areaOfExpertise ?? [
      'Psychology',
      'Counseling',
      'Mental Health',
      'Therapy',
      'Family Counseling',
      'Cognitive Behavioral Therapy',
    ];

    return Column(
      key: const ValueKey('expertise'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specializations:',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(AppSizes.size12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: expertiseAreas.map((expertise) => _buildExpertiseChip(expertise)).toList(),
        ),
        Gap(AppSizes.size16),
        OutlinedButton.icon(
          onPressed: () {
            _showAddExpertiseDialog();
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Expertise'),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDocumentsContent() {
    final theme = Theme.of(context);

    final List<Map<String, String>> documents = widget.documents ?? [
      {'name': 'Resume.pdf', 'date': 'Uploaded 2 days ago', 'size': '2.5 MB'},
      {'name': 'Degree Certificate.pdf', 'date': 'Uploaded 1 week ago', 'size': '1.2 MB'},
      {'name': 'Professional License.pdf', 'date': 'Uploaded 2 weeks ago', 'size': '890 KB'},
    ];

    return Column(
      key: const ValueKey('documents'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Uploaded Documents:',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton.icon(
              onPressed: () {
                _showUploadDocumentDialog();
              },
              icon: const Icon(Icons.upload_file),
              label: const Text('Upload'),
            ),
          ],
        ),
        Gap(AppSizes.size12),
        ...documents.map((document) =>
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.size12),
              child: _buildDocumentItem(
                document['name']!,
                document['date']!,
                document['size']!,
              ),
            ),
        ),
      ],
    );
  }

  Widget _buildExpertiseChip(String label) {
    final isDarkMode = AppTheme.isDarkMode(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.size12,
        vertical: AppSizes.size6,
      ),
      decoration: BoxDecoration(
        color: isDarkMode
            ? AppColors.darkPrimary.withValues(alpha: 0.1)
            : const Color(0xFFFDB827).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSizes.radius16),
        border: Border.all(
          color: isDarkMode
              ? AppColors.darkPrimary.withValues(alpha: 0.3)
              : const Color(0xFFFDB827).withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(AppSizes.size4),
          GestureDetector(
            onTap: () {
              // Remove expertise functionality
              _removeExpertise(label);
            },
            child: Icon(
              Icons.close,
              size: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentItem(String name, String date, String size) {
    final isDarkMode = AppTheme.isDarkMode(context);

    return Container(
      padding: EdgeInsets.all(AppSizes.size12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isDarkMode ? AppColors.darkBorder : Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(AppSizes.radius8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.description,
            color: isDarkMode ? AppColors.darkPrimary : Colors.grey[600],
          ),
          Gap(AppSizes.size12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Gap(AppSizes.size2),
                Text(
                  '$date • $size',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'view',
                child: Row(
                  children: [
                    Icon(Icons.visibility),
                    SizedBox(width: 8),
                    Text('View'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'download',
                child: Row(
                  children: [
                    Icon(Icons.download),
                    SizedBox(width: 8),
                    Text('Download'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Delete', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              _handleDocumentAction(value.toString(), name);
            },
            child: Icon(
              Icons.more_vert,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  void _showAddExpertiseDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Expertise'),
        content: const TextField(
          decoration: InputDecoration(
            hintText: 'Enter expertise area',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showUploadDocumentDialog() {
    print('Upload document dialog');
  }

  void _removeExpertise(String expertise) {
    print('Remove expertise: $expertise');
  }

  void _handleDocumentAction(String action, String documentName) {
    switch (action) {
      case 'view':
        print('View document: $documentName');
        break;
      case 'download':
        print('Download document: $documentName');
        break;
      case 'delete':
        print('Delete document: $documentName');
        break;
    }
  }
}