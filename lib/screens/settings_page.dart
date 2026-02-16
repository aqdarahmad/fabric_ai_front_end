import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _pushNotifications = false;
  String _selectedLanguage = 'English';

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Notifications Section
          _buildSectionTitle('Notifications'),
          Container(
            decoration: _buildCardDecoration(),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text(
                    'Enable Notifications',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Receive all app notifications',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  activeColor: const Color(0xFFE91E63),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                ),
                _buildDivider(),
                SwitchListTile(
                  title: const Text(
                    'Email Notifications',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Get updates via email',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                  value: _emailNotifications,
                  onChanged: (value) {
                    setState(() {
                      _emailNotifications = value;
                    });
                  },
                  activeColor: const Color(0xFFE91E63),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                ),
                _buildDivider(),
                SwitchListTile(
                  title: const Text(
                    'Push Notifications',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Receive push notifications',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                  value: _pushNotifications,
                  onChanged: (value) {
                    setState(() {
                      _pushNotifications = value;
                    });
                  },
                  activeColor: const Color(0xFFE91E63),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // App Preferences Section
          _buildSectionTitle('App Preferences'),
          Container(
            decoration: _buildCardDecoration(),
            child: Column(
              children: [
                _buildSettingTile(
                  Icons.language_rounded,
                  'Language',
                  _selectedLanguage,
                  () {
                    _showLanguagePicker();
                  },
                ),
                _buildDivider(),
                _buildSettingTile(
                  Icons.dark_mode_outlined,
                  'Theme',
                  'Light',
                  () {
                    // Show theme picker
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Security Section
          _buildSectionTitle('Security'),
          Container(
            decoration: _buildCardDecoration(),
            child: Column(
              children: [
                _buildSettingTile(
                  Icons.lock_outline_rounded,
                  'Change Password',
                  'Update your password',
                  () {
                    // Navigate to change password
                  },
                ),
                _buildDivider(),
                _buildSettingTile(
                  Icons.security_rounded,
                  'Privacy & Security',
                  'Manage your privacy settings',
                  () {
                    // Navigate to privacy settings
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Legal Section
          _buildSectionTitle('Legal'),
          Container(
            decoration: _buildCardDecoration(),
            child: Column(
              children: [
                _buildSettingTile(
                  Icons.description_outlined,
                  'Terms of Service',
                  'Read our terms',
                  () {
                    // Show terms
                  },
                ),
                _buildDivider(),
                _buildSettingTile(
                  Icons.privacy_tip_outlined,
                  'Privacy Policy',
                  'Read our privacy policy',
                  () {
                    // Show privacy policy
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Danger Zone Section
          _buildSectionTitle('Danger Zone'),
          Container(
            decoration: _buildCardDecoration(),
            child: Column(
              children: [
                _buildSettingTile(
                  Icons.delete_outline_rounded,
                  'Delete Account',
                  'Permanently delete your account',
                  () {
                    _showDeleteAccountDialog();
                  },
                  textColor: Colors.red,
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Logout Button
          OutlinedButton(
            onPressed: _logout,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 55),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout_rounded),
                SizedBox(width: 8),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  Widget _buildSettingTile(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap, {
    Color? textColor,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: (textColor ?? const Color(0xFFE91E63)).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: textColor ?? const Color(0xFFE91E63),
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey[600],
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
        color: textColor ?? Colors.grey,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[200],
    );
  }

  void _showLanguagePicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Language',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildLanguageOption('English'),
              _buildLanguageOption('العربية'),
              _buildLanguageOption('Español'),
              _buildLanguageOption('Français'),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String language) {
    return ListTile(
      title: Text(language),
      trailing: _selectedLanguage == language
          ? const Icon(Icons.check_circle, color: Color(0xFFE91E63))
          : null,
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
        Navigator.pop(context);
      },
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Delete Account',
            style: TextStyle(color: Colors.red),
          ),
          content: const Text(
            'Are you sure you want to delete your account? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Delete account logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}