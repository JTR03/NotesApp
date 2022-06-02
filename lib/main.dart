import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';
import 'package:mynotes/services/auth/firebase_auth_provider.dart';
import 'package:mynotes/views/Register_view.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/notes/create_update_note_view.dart';
import 'package:mynotes/views/notes/note_view.dart';
import 'package:mynotes/views/verify_email_view.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.green),
    home: BlocProvider(
      create: (context) => AuthBloc(FirebaseAuthProvider()),
      child: const Homepage(),
    ),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NoteView(),
      verifyRoute: (context) => const VerifiedEmailView(),
      createOrUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
    },
  ));
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthStateLoggedIn) {
        return const NoteView();
      } else if (state is AuthStateNeedsVerification) {
        return const VerifiedEmailView();
      } else if (state is AuthStateLoggedOut) {
        return const LoginView();
      } else {
        return const Scaffold(
          body: CircularProgressIndicator(),
        );
      }
    });
  }
}
