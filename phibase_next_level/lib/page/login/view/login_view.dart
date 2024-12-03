import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phibase_next_level/page/login/controller/login_controller.dart';
import 'package:phibase_next_level/routes/routes.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    final email = TextEditingController(text: 'herdha@trillium-tech.com');
    final password = TextEditingController(text: 'Admin123!');
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Welcome to phibase', 
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      controller: email,
                      validator: (String? emailValue) {
                        var emailValid = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-_]+\.[a-zA-Z]+";
                        if (emailValue!.isEmpty){
                          return 'Email can not be empty';
                        } else if (!RegExp(emailValid).hasMatch(emailValue)) {
                          return 'Email is not valid';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error
                          )
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor
                          )
                        ),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).hintColor)
                        ),
                        // border: Border.all(color: Colors.red),
                        hintText: 'e.x@mail.com',
                        hintStyle: GoogleFonts.poppins(color: Theme.of(context).hintColor),

                      ),
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Obx(() => 
                      TextFormField(
                        controller: password,
                        obscureText: controller.showPass.value,
                        validator: (String? passwordValue) {
                          if (passwordValue!.isEmpty){
                            return 'Password can not be empty';
                          } 
                          else if(passwordValue.length < 8){
                            return 'password at least 8 character';
                          } 
                          return null;
                        },
                        decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error
                            )
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor
                            )
                          ),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).dividerColor)
                          ),
                          hintText: '********',
                          hintStyle: GoogleFonts.poppins(color: Theme.of(context).hintColor),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: IconButton(
                              icon: Icon(
                                controller.showPass.value ? 
                                Icons.visibility : 
                                Icons.visibility_off,
                              ),
                              onPressed: (){
                                controller.showPass.value ?
                                controller.showPass.value = false :
                                controller.showPass.value = true;
                              },
                              color: const Color(0xFF737373),
                            ),
                          )
                        ),
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                    )
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: FilledButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          controller.login(email.text, password.text);
                          // Get.toNamed(AppRoutes.home);
                          debugPrint('success');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                      child: Text('Login',),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: FilledButton(
                      onPressed: (){
                        controller.cekTokenSimpan();
                      },
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                      child: Text('cek token',),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: FilledButton(
                      onPressed: (){
                        controller.removePrefs();
                      },
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                      child: Text('remove token',),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: FilledButton(
                      onPressed: (){
                        controller.getData();
                      },
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                      child: Text('get data',),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: FilledButton(
                      onPressed: (){
                        controller.userActive();
                      },
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                      child: Text('get current user',),
                    ),
                  ),
                ],
              )
            )
          )
        ),
      )
    );
  }
}