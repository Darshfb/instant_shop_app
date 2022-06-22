//  password validation>>
// validator: (value) {
// RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
// print(value);
// if (value.isEmpty || value.length < 3 || value.length > 16 ) {
// return 'Please Enter a correct password';
// } else {
// if (!regex.hasMatch(value))
// return 'Enter valid password';
// else
// return null;
// }
// },

// BuildCondition(
// condition: false,
// builder: (context) {
// return HomePage(() {
//
// _formKey.currentState?.save();
// if (_formKey.currentState!.validate())  {
// loginApi(
// email: '${widget.email}',
// password: '${widget.password}',
// ).then((value) {
// if (value == true) {
//
// Navigator.push(context, MaterialPageRoute(
// builder: (BuildContext context) {
// return homeScreen();
//
// }));
// } else {
//
// Navigator.push(context, MaterialPageRoute(
// builder: (BuildContext context) {
// return loginscreen();
// }));
// }
// });
// }                        });},
// fallback: (context) {
// return Center(child: CircularProgressIndicator());
// }
// )