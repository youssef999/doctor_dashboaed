import 'package:doctor/admin/views/admin_view.dart';
import 'package:doctor/features/auth/binding/auth_binding.dart';
import 'package:doctor/features/auth/views/login_view.dart';
import 'package:doctor/features/auth/views/newpass.dart';
import 'package:doctor/features/auth/views/otp.dart';
import 'package:doctor/features/auth/views/register_view.dart';
import 'package:doctor/features/auth/views/register_view_doctor.dart';
import 'package:doctor/features/auth/views/reset.dart';
import 'package:doctor/features/chats/binding/chats_binding.dart';
import 'package:doctor/features/chats/view/chat_view.dart';
import 'package:doctor/features/chats/view/chats_view.dart';
import 'package:doctor/features/doctor/appointDoc/binding/appointDoc_binding.dart';
import 'package:doctor/features/doctor/appointDoc/view/appointDoc_view.dart';
import 'package:doctor/features/doctor/appointDoc/view/submit.dart';
import 'package:doctor/features/doctor/home/binding/homeDoctor_binding.dart';
import 'package:doctor/features/doctor/home/views/homeDoctor_view.dart';
import 'package:doctor/features/doctor/patients/binding/patients_binding.dart';
import 'package:doctor/features/doctor/patients/views/patientProfile_view%20copy.dart';
import 'package:doctor/features/doctor/patients/views/patients_view.dart';
import 'package:doctor/features/doctor/rate/binding/rate_binding.dart';
import 'package:doctor/features/doctor/rate/views/rate_view.dart';
import 'package:doctor/features/driver/home/binding/homeDriver_binding.dart';
import 'package:doctor/features/driver/home/views/homeDriver_view.dart';
import 'package:doctor/features/driver/schedule/binding/schedule_binding.dart';
import 'package:doctor/features/driver/schedule/views/schedule_view.dart';
import 'package:doctor/features/more/binding/more_binding.dart';
import 'package:doctor/features/more/view/more_view.dart';
import 'package:doctor/features/notification/binding/notification_binding.dart';
import 'package:doctor/features/notification/view/notification_view.dart';
import 'package:doctor/features/profile/binding/profile_binding.dart';
import 'package:doctor/features/profile/view/clinic_view.dart';
import 'package:doctor/features/profile/view/profile_view.dart';
import 'package:doctor/features/root/binding/root_binding.dart';
import 'package:doctor/features/root/view/root_view.dart';
import 'package:doctor/features/splash/splash_view.dart';
import 'package:doctor/features/user/alert/binding/alert_binding.dart';
import 'package:doctor/features/user/alert/view/add_view.dart';
import 'package:doctor/features/user/alert/view/alert_view.dart';
import 'package:doctor/features/user/appointments/binding/apointment_binding.dart';
import 'package:doctor/features/user/appointments/view/appointment_view.dart';
import 'package:doctor/features/user/doctorUser/binding/doctor_binding.dart';
import 'package:doctor/features/user/doctorUser/view/completed_view.dart';
import 'package:doctor/features/user/doctorUser/view/doctor_view.dart';
import 'package:doctor/features/user/doctorUser/view/reservation_view.dart';
import 'package:doctor/features/user/favorite/binding/favorite_binding.dart';
import 'package:doctor/features/user/favorite/view/favorite_view.dart';
import 'package:doctor/features/user/home/binding/home_binding.dart';
import 'package:doctor/features/user/home/views/home_view.dart';
import 'package:doctor/features/user/home/widget/searchCat.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class Theme1AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.Admin;
  
  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => const SplashView()),
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(name: Routes.CATFILTER, page: () => SearchFilterCategory(), binding: HomeBinding()),
    GetPage(
        name: Routes.HOMEDOCTOR,
        page: () => const HomeDoctorView(),
        binding: HomeDoctorBinding()),

          GetPage(
        name: Routes.Admin,
        page: () => const AdminView(),
        binding: HomeDoctorBinding()),


    GetPage(
        name: Routes.HOMEDRIVER,
        page: () => const HomeDriverView(),
        binding: HomeDriverBinding()),
    GetPage(name: Routes.ROOT, page: () => RootView(), binding: RootBinding()),
    GetPage(
        name: Routes.PROFILE,
        page: () => const ProfileView(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.CLINIC,
        page: () => const ClinicView(),
        binding: ProfileBinding()),
    // GetPage(
    //     name: Routes.SUBMITAPPOINT,
    //     page: () =>  SubmitAppointmentView(

    //     ),
    //     binding: AppointmentDoctorBinding()),
    GetPage(
        name: Routes.RATE,
        page: () => const RateView(),
        binding: RateBinding()),
    GetPage(
        name: Routes.APPOINTDOC,
        page: () => const AppointmentDoctorView(),
        binding: AppointmentDoctorBinding()),
    GetPage(
        name: Routes.SCHEDULE,
        page: () => const ScheduleView(),
        binding: ScheduleBinding()),
    GetPage(
        name: Routes.PATIENTS,
        page: () => const PatientsView(),
        binding: PatientsBinding()),
    GetPage(
        name: Routes.PATIENTPROFILE,
        page: () => const PatientProfileView(),
        binding: PatientsBinding()),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.RESET,
        page: () => const ResetView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.NEWPASS,
        page: () => const PasswordResetView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.OTP, page: () => const OtpView(), binding: AuthBinding()),
    GetPage(
        name: Routes.NEWPASS,
        page: () => const ResetView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.DOCTOR,
        page: () => const DoctorProfileView(),
        binding: DoctorBinding()),
    GetPage(
        name: Routes.RESERVE,
        page: () => const ReservationView(),
        binding: DoctorBinding()),
    GetPage(
        name: Routes.COMPLETED,
        page: () => const CompletedView(),
        binding: DoctorBinding()),
    GetPage(
        name: Routes.CHATS,
        page: () => const ChatsView(),
        binding: ChatsBinding()),
    GetPage(
        name: Routes.CHAT,
        page: () => const ChatView(),
        binding: ChatsBinding()),
    GetPage(
        name: Routes.MORE,
        page: () => const MoreView(),
        binding: MoreBinding()),
    GetPage(
        name: Routes.APPOINT,
        page: () => const AppointmentView(),
        binding: AppointmentBinding()),
    GetPage(
        name: Routes.REGISTER,
        page: () => const RegisterView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.REGISTERDOC,
        page: () => const RegisterViewDoctor(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.ALERT,
        page: () => const AlertView(),
        binding: AlertBinding()),
    GetPage(
        name: Routes.ADDALERT,
        page: () => const AddAlertView(),
        binding: AlertBinding()),
    GetPage(
        name: Routes.NOTIFICATION,
        page: () => const NotificationView(),
        binding: NotificationBinding()),
    GetPage(
        name: Routes.FAVORITE,
        page: () => const FavoriteView(),
        binding: FavoriteBinding()),
  ];
}
