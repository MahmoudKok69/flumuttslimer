import 'package:flumuttslimer/roles/student/features/auth/login/login_screen.dart';
import 'package:flumuttslimer/roles/student/features/auth/register/register_screen.dart';
import 'package:flumuttslimer/roles/student/features/onboarding/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/',
    builder: (context, state) => OnBoardingScreen(),
  ),
  GoRoute(
    path: '/regester',
    builder: (context, state) => const RegisterScreen(),
  ),
]);


/*
we can send data to the page using state like :
path:/profile/:userid?filter=xyz
state.params['thing']
state.queryparams[filter]


*************************** 
The navigation 
GoRouter.of(context).go('/');


************
Bottm nav bar 
routes:[ 
  ShellRoute(
    routes:[...]
    builder:(context,state,child){
      return BottomNav(child : child); 
    }
  )
]
 */
