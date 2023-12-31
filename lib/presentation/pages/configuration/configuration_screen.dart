import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

import 'components/header/header_widget.dart';
import 'components/informations_sections/informations_section.dart';
import 'components/informations_sections/primary_info_form.dart';
import 'components/informations_sections/secondary_info_form.dart';

@RoutePage()
class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController controller = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController interestsController = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    context.read<AppBloc>().add(const AppEvent.getUser());

    super.initState();
  }

  init() {
    nameController.text = context.read<AppBloc>().state.name ?? "";
    emailController.text = context.read<AppBloc>().state.email ?? "";
    phoneController.text = context.read<AppBloc>().state.phone ?? "";
    controller.text = context.read<AppBloc>().state.lastname ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {
        if (state.updateUserStatus == StateStatus.loading ||
            state.status == StateStatus.loading ||
            state.deleteUserStatus == StateStatus.loading) {
          showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        } else if (state.status == StateStatus.success) {
          init();
          Navigator.pop(context);
        } else if (state.deleteUserStatus == StateStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Compte supprimé avec succès"),
            ),
          );
          context.router.root.popUntilRoot();
          //  context.router.push(const DashboardRoute());
          context.read<AppBloc>().add(const AppEvent.setLoggedIn());
        } else if (state.updateUserStatus == StateStatus.success) {
          init();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("modifications enregistrées avec succès"),
            ),
          );
        } else if (state.updateUserStatus == StateStatus.error) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("une erreur s'est produite"),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: materialPrimary,
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: SafeArea(
                child: CustomButton.primary(
                    onPressed: nameController.text.isEmpty == true ||
                            emailController.text.isEmpty == true ||
                            controller.text.isEmpty == true
                        ? null
                        : () {
                            context.read<AppBloc>().add(AppEvent.updateUser({
                                  "id": state.id,
                                  "first_name": nameController.text,
                                  "email": emailController.text,
                                  "phone": phoneController.text,
                                  "last_name": controller.text,
                                  "job": professionController.text,
                                  "bio": aboutcontroller.text,
                                }));
                          },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save, color: Colors.white, size: 20.sp),
                          const SizedBox(width: 10),
                          Text("Sauvegarder les changements",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text("Paramètres du profile",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                ),
                HeaderWidget(
                  title: state.name ?? state.email ?? "",
                  subtitle: "Membre depuis juin 2023",
                  imageUrl:
                      state.imageUrl ?? "https://placehold.co/600x400.png",
                ),
                InfosSection(
                  label: "Informations primaires",
                  child: PrimaryInfoForm(
                      controller: controller,
                      nameController: nameController,
                      emailController: emailController,
                      phoneController: phoneController),
                ),
                InfosSection(
                  label: "Informations secondaires",
                  child: SecondaryInfoForm(
                    professionController: professionController,
                    interestsController: interestsController,
                    aboutController: aboutcontroller,
                  ),
                ),
                // InfosSection(
                //   label: "Sécurité",
                //   child: SecurityForm(
                //     oldPasswordController: oldPasswordController,
                //     newPasswordController: newPasswordController,
                //     confirmPasswordController: confirmPasswordController,
                //   ),
                // ),
                InfosSection(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Suppression du compte"),
                            content: const Text(
                                "Êtes-vous sûr de vouloir supprimer votre compte ?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Annuler"),
                              ),
                              TextButton(
                                onPressed: () {
                                  context
                                      .read<AppBloc>()
                                      .add(const AppEvent.logout());
                                  Navigator.pop(context);
                                },
                                child: const Text("Supprimer"),
                              ),
                            ],
                          );
                        });
                  },
                  label: "Suppression du compte",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
