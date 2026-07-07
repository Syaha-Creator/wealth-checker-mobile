import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_exception.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loading,
    this.onRetry,
    this.errorMessageBuilder,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final Widget? loading;
  final VoidCallback? onRetry;
  final String Function(Object error)? errorMessageBuilder;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () =>
          loading ?? const Center(child: CircularProgressIndicator()),
      error: (error, _) => _AsyncErrorView(
        error: error,
        onRetry: onRetry,
        errorMessageBuilder: errorMessageBuilder,
      ),
    );
  }
}

class _AsyncErrorView extends StatelessWidget {
  const _AsyncErrorView({
    required this.error,
    this.onRetry,
    this.errorMessageBuilder,
  });

  final Object error;
  final VoidCallback? onRetry;
  final String Function(Object error)? errorMessageBuilder;

  String get _message {
    if (errorMessageBuilder != null) {
      return errorMessageBuilder!(error);
    }
    if (error is ApiException) {
      return (error as ApiException).message;
    }
    return 'Terjadi kesalahan. Silakan coba lagi.';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              _message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba lagi'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
