import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());
  String? depositPaymentMethod;
  String? withdrawPaymentMethod;
  TextEditingController depositAmountController = TextEditingController();
  TextEditingController withdrawAmountController = TextEditingController();
  
}
