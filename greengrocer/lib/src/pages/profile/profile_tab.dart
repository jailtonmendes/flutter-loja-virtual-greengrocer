import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do usuário'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //EMAIL
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.email,
            icon: Icons.email,
            label: 'Email',
          ),

          //NOME
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.name,
            icon: Icons.person,
            label: 'Nome',
          ),

          //CELULAR
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.phone,
            icon: Icons.phone,
            label: 'Celular',
          ),

          //CPF
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),

          //BOTÃO ATUALIZAR SENHA
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                updatePassword();
              },
              child: Text('Atualizar senha'),
            ),
          ),
        ],
      ),
    );
  }

  //FUNÇÃO DE ATUALIZAR SENHA
  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Atualização de senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),

                    //SENHA ATUAL
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha atual',
                      isSecret: true,
                    ),

                    //NOVA SENHA
                    CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Nova atual',
                      isSecret: true,
                    ),

                    //CONFIRMAÇÃO NOVA SENHA
                    CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Confirmação nova senha',
                      isSecret: true,
                    ),

                    //BOTÃO CONFIRMAÇÃO DE SENHA
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                        onPressed: () {},
                        child: Text('Atualizar'),
                      ),
                    ),
                  ],
                ),
              ),

              //BOTÃO FECHAR MODAL
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
