import 'package:form_bloc/form_bloc.dart';
import 'package:quiver/core.dart';
import 'package:test/test.dart';

void main() {
  group('SelectFieldBlocState:', () {
    test('copyWith.', () {
      final suggestions = (String pattern) async => [1];

      final state = SelectFieldBlocState<int>(
        value: null,
        error: null,
        isInitial: false,
        isRequired: false,
        suggestions: null,
        isValidated: false,
        formBlocState: FormBlocLoaded<dynamic, dynamic>(true),
        toStringName: null,
        items: null,
      );
      final stateCopy1 = state.copyWith(
        value: Optional.of(1),
        error: Optional.of('error'),
        isInitial: true,
        suggestions: Optional.of(suggestions),
        isValidated: true,
        formBlocState: FormBlocLoading<dynamic, dynamic>(),
        items: Optional.of([1]),
      );
      final stateCopy2 = stateCopy1.copyWith(
        value: Optional.fromNullable(null),
        error: Optional.fromNullable(null),
        isInitial: false,
        suggestions: Optional.fromNullable(null),
        isValidated: false,
        formBlocState: FormBlocLoaded<dynamic, dynamic>(true),
        items: Optional.fromNullable(null),
      );
      final stateCopy3 = stateCopy2.copyWith();

      final statesCopies = [stateCopy1, stateCopy2, stateCopy3];

      final expectedStates = [
        SelectFieldBlocState<int>(
          value: 1,
          error: 'error',
          isInitial: true,
          isRequired: false,
          suggestions: suggestions,
          isValidated: true,
          formBlocState: FormBlocLoading<dynamic, dynamic>(),
          toStringName: null,
          items: [1],
        ),
        state,
        state,
      ];
      expect(
        statesCopies,
        expectedStates,
      );
    });
  });
}