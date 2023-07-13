import 'package:fluro/fluro.dart';
import 'package:haozuke_test/pages/home/index.dart';
import 'package:haozuke_test/pages/login.dart';
import 'package:haozuke_test/pages/not_found.dart';
import 'package:haozuke_test/pages/register.dart';
import 'package:haozuke_test/pages/room_detail/index.dart';
import 'package:haozuke_test/pages/table/index.dart';

class Routes {

 static String home="/";
 static String login="/login";
 static String register="/register";
 static String roomDetail="/room/:roomId";
 static String table="/table";

 static final Handler _homeHandler = Handler(handlerFunc: (ctx,parm) {
  return const HomePage();
 });

 static final Handler _loginHandler = Handler(handlerFunc: (ctx,parm) {
  return const LoginPage();
 });

 static final Handler _registerHandler = Handler(handlerFunc: (ctx,parm) {
  return const RegisterPage();
 });

 static final Handler _notFoundHandler = Handler(handlerFunc: (ctx,parm) {
  return const NotFoundPage();
 });

 static final Handler _roomDetailHandler = Handler(handlerFunc: (ctx,parm) {
  return RoomDetail(roomId: parm["roomId"]?[0] ?? "未找到ID");
 });

 static final Handler _tableHandler = Handler(handlerFunc: (ctx,parm) {
  return const TablePage();
 });

 static void configureRoutes(FluroRouter router) {
  router.define(home, handler: _homeHandler);
  router.define(login, handler: _loginHandler);
  router.define(register, handler: _registerHandler);
  router.define(roomDetail, handler: _roomDetailHandler);
  router.notFoundHandler = _notFoundHandler;
  router.define(table, handler: _tableHandler);
 }

}