import 'package:flutter_test/flutter_test.dart';
import 'package:passwd/services/password/password_impl.dart';
import 'package:passwd/services/password/password_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("PasswordService Test -", () {
    group("PasswordImpl Test -", () {
      test(
        "Test the generation of a diceware password with 5 words and capitalizition on",
        () async {
          PasswordService service = PasswordImpl();

          String password = await service.generateDicewarePassword(
            words: 5,
            capitalize: true,
          );

          expect(password.split(" ").length, 5);

          List<String> words = password.split(" ");

          for (int i = 0; i < words.length; i++) {
            expect(
              words.elementAt(i)[0].toUpperCase() == words.elementAt(i)[0],
              true,
            );
          }
        },
      );

      test(
        "Test the generation of a random password with a length of 16",
        () {
          PasswordService service = PasswordImpl();

          String password = service.generateRandomPassword(
            length: 16,
          );

          expect(password.length, 16);
        },
      );

      test(
        "Test the PRNG",
        () {
          PasswordService service = PasswordImpl();

          int rand1 = service.getPsuedoRandomNumber(255);
          int rand2 = service.getPsuedoRandomNumber(255);

          expect(rand1 == rand2, false);
        },
      );
    });
  });
}
