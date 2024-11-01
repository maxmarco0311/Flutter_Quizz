import 'package:flutter/material.dart';
import 'package:flutter_quizz/Models/user_model.dart';
import 'package:flutter_quizz/bloc/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Question10Screen extends StatefulWidget {
  const Question10Screen({super.key});
  static const routeName = '/question10';

  @override
  State<Question10Screen> createState() => _Question10ScreenState();
}

class _Question10ScreenState extends State<Question10Screen> {
  late final UserBloc _userBloc = context.read<UserBloc>();
  final List<User> _users = [];
  bool _isLoading = false;

  @override
  void initState() {
    _userBloc.add(FetchUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is FetchUserLoading) {
          setState(() {
            _isLoading = true;
          });
        }
        if (state is FetchUserSuccess) {
          setState(() {
            _isLoading = false;
            _users.addAll(state.users);
          });
        }
        if (state is FetchUserFailure) {
          setState(() {
            _isLoading = true;
          });
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _users.clear();
            });
            _userBloc.add(FetchUserEvent());
          },
          child: const Text('Start'),
        ),
        appBar: AppBar(
          title: const Text('Question 10'),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        User user = _users[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(user.imagePath),
                            ),
                            title: Text(
                              user.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(user.email),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                debugPrint('Delete ${user.name}');
                              },
                            ),
                          ),
                        );
                      },
                      childCount: _users.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
