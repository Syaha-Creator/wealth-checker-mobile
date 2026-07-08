import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../features/auth/data/auth_repository.dart';
import '../../../../shared/providers/auth_state_provider.dart';
import '../widgets/auth_page_widgets.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String? _errorMessage;

  static const _minPasswordLength = 8;

  Future<void> _submit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    final name = values['name'] as String;
    final email = values['email'] as String;
    final password = values['password'] as String;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final token = await ref.read(authRepositoryProvider).signUp(
            name: name.trim(),
            email: email.trim(),
            password: password,
          );
      await ref.read(authStateProvider.notifier).setAuthenticated(token);
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
      backgroundColor: AppColors.bgPrimary,
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
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const AuthPageHeader(
                        subtitle:
                            'Buat akun baru untuk mulai memantau kekayaanmu',
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      AuthLabeledField(
                        label: 'Nama',
                        field: FormBuilderTextField(
                          name: 'name',
                          style: authFieldTextStyle,
                          decoration: authInputDecoration(
                            hintText: 'Nama lengkap',
                          ),
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      AuthLabeledField(
                        label: 'Email',
                        field: FormBuilderTextField(
                          name: 'email',
                          style: authFieldTextStyle,
                          decoration: authInputDecoration(
                            hintText: 'nama@email.com',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      AuthLabeledField(
                        label: 'Kata Sandi',
                        field: FormBuilderTextField(
                          name: 'password',
                          style: authFieldTextStyle,
                          decoration: authInputDecoration(
                            hintText: 'Minimal $_minPasswordLength karakter',
                          ),
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onSubmitted: (_) => _isLoading ? null : _submit(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(_minPasswordLength),
                          ]),
                        ),
                      ),
                      if (_errorMessage != null) ...[
                        const SizedBox(height: AppSpacing.lg),
                        AuthErrorBanner(message: _errorMessage!),
                      ],
                      const SizedBox(height: AppSpacing.xl),
                      AuthPrimaryButton(
                        label: 'Daftar',
                        isLoading: _isLoading,
                        onPressed: _submit,
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      AuthFooterLink(
                        leadingText: 'Sudah punya akun? ',
                        actionText: 'Masuk',
                        enabled: !_isLoading,
                        onTap: () => context.go('/login'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
