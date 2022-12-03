import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_authentication/utils/fire_auth.dart';

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

final MockUser _mockUser = MockUser();
final MockUserCredential _mockUserCred = MockUserCredential();

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Stream<User> authStateChanges() {
    return Stream.fromIterable([
      _mockUser,
    ]);
  }
}

void main() {
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  //final FireAuth auth = FireAuth(auth: mockFirebaseAuth);
  final FireAuth auth = FireAuth();
  setUp(() {});
  tearDown(() {});

  // test("emit occurs", () async {
  //   expectLater(auth.user, emitsInOrder([_mockUser]));
  // });

  test("create account", () async {
    when(
      await mockFirebaseAuth.createUserWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) => _mockUserCred);

    expect(
        await FireAuth.registerUsingEmailPassword(
            name: "Test User", email: "tadas@gmail.com", password: "123456"),
        _mockUser);
  });

  test("create account exception", () async {
    when(
      mockFirebaseAuth.createUserWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "You screwed up", code: "-1"));

    expect(
        await FireAuth.signInUsingEmailPassword(
            email: "tadas@gmail.com", password: "123456"),
        "You screwed up");
  });

  test("sign in", () async {
    when(
      await mockFirebaseAuth.signInWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) => _mockUserCred);

    expect(
        await FireAuth.signInUsingEmailPassword(
            email: "tadas@gmail.com", password: "123456"),
        _mockUserCred);
  });

  test("sign in exception", () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "You screwed up", code: "-1"));

    expect(
        await FireAuth.signInUsingEmailPassword(
            email: "tadas@gmail.com", password: "123456"),
        "You screwed up");
  });

  // test("sign out", () async {
  //   when(
  //     mockFirebaseAuth.signOut(),
  //   ).thenAnswer((realInvocation) => viod);

  //   expect(await auth.signOut(), "Success");
  // });

  // test("create account exception", () async {
  //   when(
  //     mockFirebaseAuth.signOut(),
  //   ).thenAnswer((realInvocation) =>
  //       throw FirebaseAuthException(message: "You screwed up"));

  //   expect(await auth.signOut(), "You screwed up");
  // });
}
