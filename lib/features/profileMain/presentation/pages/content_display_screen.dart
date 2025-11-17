import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/enum/content_display_type.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/profileMain/domain/entities/help_entity.dart'
    as help;
import 'package:fitness_app/features/profileMain/domain/entities/privacy_policy_entity.dart'
    as privacy;
import 'package:fitness_app/features/profileMain/domain/entities/security_roles_config_entity.dart'
    as security;
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_event.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_state.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentDisplayScreen extends StatefulWidget {
  const ContentDisplayScreen({super.key, required this.type});

  final ContentDisplayType type;

  @override
  State<ContentDisplayScreen> createState() => _ContentDisplayScreenState();
}

class _ContentDisplayScreenState extends State<ContentDisplayScreen> {
  late final ProfileMainViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<ProfileMainViewModel>();
    _triggerFetch(widget.type);
  }

  @override
  void didUpdateWidget(covariant ContentDisplayScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type != widget.type) {
      _triggerFetch(widget.type);
    }
  }

  @override
  void dispose() {
    _viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return BlocProvider.value(
      value: _viewModel,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            _titleFor(widget.type),
            style: textTheme.titleMedium?.copyWith(color: AppColorsLight.white),
          ),
          iconTheme: const IconThemeData(color: AppColorsLight.white),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(Assets.assetsImagesHomeBg, fit: BoxFit.cover),
            SafeArea(
              child: BlocBuilder<ProfileMainViewModel, ProfileMainState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColorsLight.white,
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.padding_20,
                      vertical: AppSizes.padding_24,
                    ),
                    child: _buildContent(context, widget.type, state),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ContentDisplayType type,
    ProfileMainState state,
  ) {
    return switch (type) {
      ContentDisplayType.security => _buildSecurityContent(
        context,
        state.securityRolesConfig,
      ),
      ContentDisplayType.privacyPolicy => _buildPrivacyContent(
        context,
        state.privacyPolicy,
      ),
      ContentDisplayType.help => _buildHelpContent(context, state.helpContent),
    };
  }

  Widget _buildSecurityContent(
    BuildContext context,
    security.SecurityRolesConfigEntity? data,
  ) {
    final List<Widget> sections = [];

    if (data!.pageTitle != null || data.pageDescription != null) {
      sections.add(
        _buildSectionCard(
          context,
          title: _localized(context, data.pageTitle),
          content: _buildText(
            context,
            _localized(context, data.pageDescription),
          ),
        ),
      );
    }

    final List<security.RoleDefinitionEntity> roles = data.roles ?? [];

    if (roles.isNotEmpty) {
      sections.add(
        _buildSectionCard(
          context,
          title: _localized(
            context,
            data.roleListTitle,
            fallback: 'Available Roles',
          ),
          content: Column(
            children: roles
                .map((role) => _buildRoleCard(context, role))
                .toList(),
          ),
        ),
      );
    }

    return Column(children: sections);
  }

  Widget _buildPrivacyContent(
    BuildContext context,
    privacy.PrivacyPolicyEntity? data,
  ) {
    final List<Widget> sections = [];

    if (data!.title != null) {
      sections.add(
        _buildSectionCard(
          context,
          title: _localized(context, data.title),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data.lastUpdated != null)
                _buildText(
                  context,
                  _localized(context, data.lastUpdated),
                  isSecondary: true,
                ),
              if (data.introduction != null) ...[
                const SizedBox(height: AppSizes.spaceBetweenItems_12),
                _buildText(context, _localized(context, data.introduction)),
              ],
            ],
          ),
        ),
      );
    }

    if (data.informationCollection != null) {
      sections.add(
        _buildSectionCard(
          context,
          title: _localized(
            context,
            data.informationCollection?.title,
            fallback: 'Information We Collect',
          ),
          content: _buildSubSections(
            context,
            data.informationCollection!.subSections ?? [],
          ),
        ),
      );
    }

    final List<_ListSection> listSections = [
      if (data.howWeUseInfo != null)
        _ListSection(
          title: data.howWeUseInfo!.title,
          items: data.howWeUseInfo!.items,
        ),
      if (data.howWeShareInfo != null)
        _ListSection(
          title: data.howWeShareInfo!.title,
          items: data.howWeShareInfo!.items,
        ),
      if (data.dataSecurity != null)
        _ListSection(
          title: data.dataSecurity!.title,
          items: data.dataSecurity!.items,
        ),
      if (data.dataRights != null)
        _ListSection(
          title: data.dataRights!.title,
          items: data.dataRights!.items,
        ),
      if (data.childrensPrivacy != null)
        _ListSection(
          title: data.childrensPrivacy!.title,
          items: data.childrensPrivacy!.items,
        ),
      if (data.changesToPolicy != null)
        _ListSection(
          title: data.changesToPolicy!.title,
          items: data.changesToPolicy!.items,
        ),
      if (data.contactUs != null)
        _ListSection(
          title: data.contactUs!.title,
          items: data.contactUs!.items,
        ),
    ];

    for (final section in listSections) {
      sections.add(
        _buildSectionCard(
          context,
          title: _localized(context, section.title),
          content: _buildListItems(context, section.items),
        ),
      );
    }

    return Column(children: sections);
  }

  Widget _buildHelpContent(BuildContext context, help.HelpContentEntity? data) {
    final List<Widget> sections = [];

    if (data!.pageTitle != null || data.pageSubtitle != null) {
      sections.add(
        _buildSectionCard(
          context,
          title: _localized(context, data.pageTitle),
          content: _buildText(context, _localized(context, data.pageSubtitle)),
        ),
      );
    }

    final List<help.ContactMethodEntity> contacts =
        data.contacts ?? <help.ContactMethodEntity>[];

    if (contacts.isNotEmpty) {
      sections.add(
        _buildSectionCard(
          context,
          title: 'Get in Touch',
          content: Column(
            children: contacts
                .map((contact) => _buildContactCard(context, contact))
                .toList(),
          ),
        ),
      );
    }

    final List<help.FaqItemEntity> faqs = data.faqs ?? <help.FaqItemEntity>[];

    if (faqs.isNotEmpty) {
      sections.add(
        _buildSectionCard(
          context,
          title: 'Frequently Asked Questions',
          content: Column(
            children: faqs.map((faq) => _buildFaqTile(context, faq)).toList(),
          ),
        ),
      );
    }

    return Column(children: sections);
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String? title,
    required Widget? content,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: AppSizes.padding_24),
      padding: const EdgeInsets.all(AppSizes.padding_20),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
        border: Border.all(color: AppColorsLight.black[70]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null && title.isNotEmpty) ...[
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                color: AppColorsLight.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBetweenItems_16),
          ],
          if (content != null) content,
        ],
      ),
    );
  }

  Widget _buildText(
    BuildContext context,
    String text, {
    bool isSecondary = false,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Text(
      text,
      style: (isSecondary ? textTheme.bodySmall : textTheme.bodyMedium)
          ?.copyWith(
            color: isSecondary
                ? AppColorsLight.black[30]
                : AppColorsLight.black[20],
            height: 1.5,
          ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context,
    security.RoleDefinitionEntity role,
  ) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color? highlightColor = _parseHexColor(role.highlightColor);
    final List<security.PermissionEntity> permissions =
        role.permissions ?? <security.PermissionEntity>[];

    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBetweenItems_12),
      padding: const EdgeInsets.all(AppSizes.padding_16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius_16),
        border: Border.all(
          color:
              highlightColor?.withValues(alpha: 0.5) ??
              AppColorsLight.black[70]!,
        ),
        color: colorScheme.surface.withValues(alpha: 0.15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _localized(context, role.name, fallback: 'Unnamed Role'),
            style: textTheme.titleSmall?.copyWith(
              color: AppColorsLight.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (role.description != null) ...[
            const SizedBox(height: AppSizes.spaceBetweenItems_8),
            _buildText(context, _localized(context, role.description)),
          ],
          if (permissions.isNotEmpty) ...[
            const SizedBox(height: AppSizes.spaceBetweenItems_12),
            Text(
              'Permissions',
              style: textTheme.labelLarge?.copyWith(
                color: AppColorsLight.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBetweenItems_8),
            ...permissions.map(
              (permission) => _buildPermissionItem(context, permission),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPermissionItem(
    BuildContext context,
    security.PermissionEntity permission,
  ) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String title = _localized(
      context,
      permission.name,
      fallback: 'Permission',
    );
    final String description = _localized(context, permission.description);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceBetweenItems_8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: AppSizes.padding_4),
                child: Icon(
                  Icons.check_circle_outline,
                  size: AppSizes.icon_16,
                  color: AppColorsLight.green,
                ),
              ),
              const SizedBox(width: AppSizes.spaceBetweenItems_8),
              Expanded(
                child: Text(
                  title,
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColorsLight.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          if (description.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.padding_24,
                top: AppSizes.padding_4,
              ),
              child: _buildText(context, description),
            ),
          ],
          if ((permission.key ?? '').isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.padding_24,
                top: AppSizes.padding_4,
              ),
              child: Text(
                'Key: ${permission.key}',
                style: textTheme.labelSmall?.copyWith(
                  color: AppColorsLight.black[40],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSubSections(
    BuildContext context,
    List<privacy.PolicyParagraphSubSection> subSections,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: subSections
          .map(
            (subSection) => Padding(
              padding: const EdgeInsets.only(
                bottom: AppSizes.spaceBetweenItems_12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (subSection.title != null)
                    Text(
                      _localized(context, subSection.title),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColorsLight.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (subSection.content != null) ...[
                    const SizedBox(height: AppSizes.spaceBetweenItems_6),
                    _buildText(
                      context,
                      _localized(context, subSection.content),
                    ),
                  ],
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildListItems(BuildContext context, privacy.LocalizedList? items) {
    if (items == null) return const SizedBox.shrink();

    final List<String> itemList = _localizedList(context, items);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: itemList
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.spaceBetweenItems_6,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppSizes.spaceBetweenItems_6,
                    ),
                    child: Icon(
                      Icons.circle,
                      size: AppSizes.icon_8,
                      color: AppColorsLight.black[30],
                    ),
                  ),
                  const SizedBox(width: AppSizes.spaceBetweenItems_12),
                  Expanded(child: _buildText(context, item)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildContactCard(
    BuildContext context,
    help.ContactMethodEntity contact,
  ) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final String title = _localized(
      context,
      contact.method,
      fallback: 'Contact',
    );
    final String subtitle = _localized(context, contact.details);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBetweenItems_8),
      padding: const EdgeInsets.all(AppSizes.padding_16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius_16),
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.22),
        border: Border.all(color: AppColorsLight.black[70]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleSmall?.copyWith(
              color: AppColorsLight.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: AppSizes.padding_4),
            _buildText(context, subtitle, isSecondary: true),
          ],
          if ((contact.value ?? '').isNotEmpty) ...[
            const SizedBox(height: AppSizes.spaceBetweenItems_12),
            SelectableText(
              contact.value!,
              style: textTheme.bodyMedium?.copyWith(
                color: AppColorsLight.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFaqTile(BuildContext context, help.FaqItemEntity faq) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String question = _localized(
      context,
      faq.question,
      fallback: 'Question',
    );
    final String answer = _localized(context, faq.answer, fallback: 'Answer');

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding_4,
          vertical: AppSizes.spaceBetweenItems_6,
        ),
        collapsedIconColor: AppColorsLight.white,
        iconColor: AppColorsLight.orange,
        title: Text(
          question,
          style: textTheme.titleSmall?.copyWith(
            color: AppColorsLight.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.spaceBetweenItems_12,
                right: AppSizes.spaceBetweenItems_8,
                bottom: AppSizes.spaceBetweenItems_12,
              ),
              child: _buildText(context, answer),
            ),
          ),
        ],
      ),
    );
  }

  void _triggerFetch(ContentDisplayType type) {
    _viewModel.doIntend(switch (type) {
      ContentDisplayType.security => GetSecurityRolesConfigEvent(),
      ContentDisplayType.privacyPolicy => GetPrivacyPolicyEvent(),
      ContentDisplayType.help => GetHelpContentEvent(),
    });
  }

  String _titleFor(ContentDisplayType type) {
    return switch (type) {
      ContentDisplayType.security => 'Security & Roles',
      ContentDisplayType.privacyPolicy => 'Privacy & Security',
      ContentDisplayType.help => 'Help & Support',
    };
  }

  String _localized(
    BuildContext context,
    Object? text, {
    String fallback = '',
  }) {
    String? en;
    String? ar;

    if (text is security.LocalizedText) {
      en = text.en;
      ar = text.ar;
    } else if (text is privacy.LocalizedText) {
      en = text.en;
      ar = text.ar;
    } else if (text is help.LocalizedText) {
      en = text.en;
      ar = text.ar;
    }

    final String languageCode = Localizations.localeOf(context).languageCode;

    return switch (languageCode) {
      'ar' => ar ?? en ?? fallback,
      _ => en ?? ar ?? fallback,
    };
  }

  List<String> _localizedList(
    BuildContext context,
    privacy.LocalizedList? list,
  ) {
    if (list == null) return <String>[];
    final String languageCode = Localizations.localeOf(context).languageCode;

    return switch (languageCode) {
      'ar' => list.ar ?? list.en ?? <String>[],
      _ => list.en ?? list.ar ?? <String>[],
    };
  }

  Color? _parseHexColor(String? hex) {
    if (hex == null || hex.isEmpty) return null;
    final String normalized = hex.replaceFirst('#', '');
    if (normalized.length != 6 && normalized.length != 8) return null;

    final String value = normalized.length == 6 ? 'FF$normalized' : normalized;
    try {
      return Color(int.parse(value, radix: 16));
    } catch (_) {
      return null;
    }
  }
}

class _ListSection {
  const _ListSection({required this.title, required this.items});

  final privacy.LocalizedText? title;
  final privacy.LocalizedList? items;
}
