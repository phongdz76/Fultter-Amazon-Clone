import 'package:amazone/common/widgets/custom_button.dart';
import 'package:amazone/common/widgets/custom_textfield.dart';
import 'package:amazone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth {
  signUp,
  signIn,
}

class AuthScreen extends StatefulWidget{
  static const String routeName = '/auth screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  void signUpUser() {
    if (_signUpFormKey.currentState!.validate()) {
      print('Sign up with: ${_nameController.text}, ${_emailController.text}');
    }
  }

  void signInUser() {
    if (_signInFormKey.currentState!.validate()) {
      print('Sign in with: ${_emailController.text}');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1565C0), // Deep Blue
              const Color(0xFF42A5F5), // Light Blue
              const Color(0xFFE3F2FD), // Very Light Blue
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    
                    // Amazon Logo with Animation
                    TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 1500),
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, double value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Text(
                              'Amazon',
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w800,
                                color: GlobalVariables.secondaryColor,
                                letterSpacing: -2,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 30),
                    
                    // Welcome Section
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Welcome to Amazon',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF232F3E),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Shop millions of products worldwide',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Auth Tabs
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 25,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Tab Selector
                          Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _auth = Auth.signUp;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      decoration: BoxDecoration(
                                        color: _auth == Auth.signUp 
                                          ? GlobalVariables.secondaryColor
                                          : Colors.transparent,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: _auth == Auth.signUp 
                                          ? [
                                              BoxShadow(
                                                color: GlobalVariables.secondaryColor.withOpacity(0.3),
                                                blurRadius: 8,
                                                offset: const Offset(0, 4),
                                              ),
                                            ]
                                          : null,
                                      ),
                                      child: Text(
                                        'Sign Up',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: _auth == Auth.signUp 
                                            ? Colors.white
                                            : Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _auth = Auth.signIn;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      decoration: BoxDecoration(
                                        color: _auth == Auth.signIn 
                                          ? GlobalVariables.secondaryColor
                                          : Colors.transparent,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: _auth == Auth.signIn 
                                          ? [
                                              BoxShadow(
                                                color: GlobalVariables.secondaryColor.withOpacity(0.3),
                                                blurRadius: 8,
                                                offset: const Offset(0, 4),
                                              ),
                                            ]
                                          : null,
                                      ),
                                      child: Text(
                                        'Sign In',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: _auth == Auth.signIn 
                                            ? Colors.white
                                            : Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Form Content
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              );
                            },
                            child: _auth == Auth.signUp ? _buildSignUpForm() : _buildSignInForm(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Features Section
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: GlobalVariables.secondaryColor.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.local_shipping,
                                color: GlobalVariables.secondaryColor,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Free shipping worldwide',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.security,
                                color: GlobalVariables.secondaryColor,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Secure payment & data protection',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Footer
                    Text(
                      'By continuing, you agree to Amazon\'s\nConditions of Use and Privacy Notice.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.8),
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Container(
      key: const ValueKey('signup'),
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _signUpFormKey,
        child: Column(
          children: [
            CustomTextfield(
              controller: _nameController,
              hintText: 'Full Name',
            ),
            
            const SizedBox(height: 16),
            CustomTextfield(
              controller: _emailController,
              hintText: 'Email Address',
            ),
      
            const SizedBox(height: 16),
            CustomTextfield(
              controller: _passwordController,
              hintText: 'Password',
            ),

            const SizedBox(height: 24),
            CustomButton(
              text: 'Create Account',
              onTap: signUpUser,
              color: GlobalVariables.secondaryColor,
              borderRadius: 16,
              height: 56,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    return Container(
      key: const ValueKey('signin'),
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _signInFormKey,
        child: Column(
          children: [
            CustomTextfield(
              controller: _emailController,
              hintText: 'Email Address',
            ),
      
            const SizedBox(height: 16),
            CustomTextfield(
              controller: _passwordController,
              hintText: 'Password',
            ),

            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Forgot password logic
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: GlobalVariables.secondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),
            CustomButton(
              text: 'Sign In',
              onTap: signInUser,
              color: GlobalVariables.secondaryColor,
              borderRadius: 16,
              height: 56,
            ),
          ],
        ),
      ),
    );
  }
}