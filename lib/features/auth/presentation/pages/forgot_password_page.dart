import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../features/auth/data/auth_repository.dart';
import '../widgets/auth_page_widgets.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  bool _isSubmitted = false;
  String? _errorMessage;

  static const _successMessage =
      'Jika email terdaftar, tautan reset sudah dikirim. Silakan cek email kamu.';

  Future<void> _submit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final email = (_formKey.currentState!.value['email'] as String).trim();

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await ref.read(authRepositoryProvider).requestPasswordReset(email);
      if (!mounted) {
        return;
      }
      setState(() => _isSubmitted = true);
    } on ApiException catch (error) {
      setState(() => _errorMessage = error.message);
    } catch (_) {
      setState(
        () => _errorMessage = 'Terjadi kesalahan. Silakan coba lagi.',
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.semanticColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xxl,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - (AppSpacing.xxl * 2),
                ),
                child: _isSubmitted ? _buildSuccessContent() : _buildFormContent(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFormContent() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AuthPageHeader(
            title: 'Lupa Kata Sandi',
            subtitle:
                'Masukkan email akunmu, kami kirimkan tautan reset kata sandi',
          ),
          const SizedBox(height: AppSpacing.xxl),
          AuthLabeledField(
            label: 'Email',
            field: FormBuilderTextField(
              name: 'email',
              style: authFieldTextStyle,
              decoration: authInputDecoration(
                hintText: 'nama@email.com',
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSubmitted: (_) => _isLoading ? null : _submit(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
          ),
          if (_errorMessage != null) ...[
            const SizedBox(height: AppSpacing.lg),
            AuthErrorBanner(message: _errorMessage!),
          ],
          const SizedBox(height: AppSpacing.xl),
          AuthPrimaryButton(
            label: 'Kirim Tautan Reset',
            isLoading: _isLoading,
            onPressed: _submit,
          ),
          const SizedBox(height: AppSpacing.xl),
          AuthFooterLink(
            leadingText: 'Ingat kata sandimu? ',
            actionText: 'Masuk',
            enabled: !_isLoading,
            onTap: () => context.go('/login'),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AuthPageHeader(
          title: 'Lupa Kata Sandi',
          subtitle: 'Permintaan reset kata sandi diterima',
        ),
        const SizedBox(height: AppSpacing.xxl),
        const AuthSuccessBanner(message: _successMessage),
        const SizedBox(height: AppSpacing.xl),
        AuthFooterLink(
          leadingText: 'Ingat kata sandimu? ',
          actionText: 'Masuk',
          onTap: () => context.go('/login'),
        ),
      ],
    );
  }
}
