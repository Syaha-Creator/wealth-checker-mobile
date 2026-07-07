/// Request payload for creating or updating a dream goal.
class DreamGoalInput {
  const DreamGoalInput({
    required this.namaGoal,
    required this.targetNominal,
    this.accountId,
    this.saldoManual,
    this.unlinkAccount = false,
  });

  final String namaGoal;
  final int targetNominal;

  /// Set when tracking progress via a linked account.
  final String? accountId;

  /// Set when tracking progress via a manual balance (no linked account).
  final double? saldoManual;

  /// When `true`, sends `accountId: null` explicitly on PATCH to unlink.
  final bool unlinkAccount;

  /// Client-side guard — mirrors server `422` when both are provided.
  void validate() {
    if (accountId != null && saldoManual != null) {
      throw const DreamGoalInputException(
        'Pilih salah satu: link ke rekening atau saldo manual, tidak keduanya.',
      );
    }
  }

  Map<String, dynamic> toCreateJson() {
    validate();
    final body = <String, dynamic>{
      'namaGoal': namaGoal,
      'targetNominal': targetNominal,
    };
    if (accountId != null) {
      body['accountId'] = accountId;
    } else if (saldoManual != null) {
      body['saldoManual'] = saldoManual;
    }
    return body;
  }

  Map<String, dynamic> toUpdateJson() {
    validate();
    final body = <String, dynamic>{
      'namaGoal': namaGoal,
      'targetNominal': targetNominal,
    };
    if (unlinkAccount) {
      body['accountId'] = null;
      if (saldoManual != null) {
        body['saldoManual'] = saldoManual;
      }
    } else if (accountId != null) {
      body['accountId'] = accountId;
    } else if (saldoManual != null) {
      body['saldoManual'] = saldoManual;
    }
    return body;
  }
}

class DreamGoalInputException implements Exception {
  const DreamGoalInputException(this.message);

  final String message;

  @override
  String toString() => message;
}
