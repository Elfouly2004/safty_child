import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safty_children/core/routing/Routes.dart';
import 'package:safty_children/features/home/presentation/views/home_screen.dart';
import 'package:safty_children/features/home/presentation/views/web_view_screen.dart';
import 'package:safty_children/features/media/presentation/views/media_screen.dart';
import 'package:safty_children/features/test/bloc/cubit/test_cubit.dart';
import 'package:safty_children/features/test/data/questions%20stage/stage_four_questions.dart';
import 'package:safty_children/features/test/data/questions%20stage/stage_one_intro.dart';
import 'package:safty_children/features/test/data/questions%20stage/stage_thee_questions.dart';
import 'package:safty_children/features/test/data/questions%20stage/stage_two_questions.dart';
import 'package:safty_children/features/test/presentation/views/test_screen.dart';
import 'package:safty_children/features/topics/presentation/views/knowledge_screen.dart';
import 'package:safty_children/features/topics/presentation/views/practice_screen.dart';
import 'package:safty_children/features/topics/presentation/views/select_topic_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.webView:
        return MaterialPageRoute(
          builder: (_) => WebViewScreen(url: settings.arguments as String),
        );
      case Routes.select:
        return MaterialPageRoute(
          builder:
              (_) => SelectTopicScreen(topic: settings.arguments as String),
        );
      case Routes.knowledge:
        return MaterialPageRoute(
          builder: (_) => KnowledgeScreen(topic: settings.arguments as String),
        );
      case Routes.practice:
        return MaterialPageRoute(
          builder: (_) => PracticeScreen(topic: settings.arguments as String),
        );
      case Routes.media:
        return MaterialPageRoute(builder: (_) => MediaScreen());
      case Routes.test:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => TestCubit([stageOneIntro, stageTwoQuestions,stageThreeQuestions,stageFourQuestions]),
                child: TestScreen(),
              ),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text(
                    'No route defined for ${settings.name ?? "Null"}',
                  ),
                ),
              ),
        );
    }
  }
}