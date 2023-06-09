import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'signin': 'Sign In',
          'buttonTextSignIn': 'SIGN IN',
          'emailLabelText': 'Email',
          'emailHintText': 'Enter Your Email',
          'passwordLabelText': 'Password',
          'passwordHintText': 'Enter Your Password',
          'validEmailText': 'Enter Your Email',
          'validEmailText1': 'Enter Valid Email',
          'validPasswordText': 'Enter Your Password',
          'validPasswordText1': 'Not Match',
          'loginSuccessSnackBarText': 'Login Successful',
          'loginSuccessSnackBarText2': 'Welcome',
          'loginFailSnackBarText': 'Login Failed',
          'loginFailSnackBarText2': 'Invalid email or password',
          'loginExceptionSnackBarText2': 'An error occurred while logging in',
          'logoutSuccessSnackBarText': 'Logout Successful',
          'logoutSuccessSnackBarText2': 'Goodbye',
          'logoutFailSnackBarText': 'Logout Failed',
          'logoutExceptionSnackBarText2': 'An error occurred while logging out',
          'AppBarDashboardText': 'Home',
          'AppBarInspectionText': 'Inspection',
          'AppBarInspectionText1': 'Inspection Report',
          'AppBarCustomInspectionText': 'Custom Inspection',
          'radiatorLevelText': 'Radiator Level',
          'AppBarProfileText': 'Profile',
          'engineOilText': 'Engine Oil',
          'hydraulicOilText': 'Hydraulic Oil',
          'brakeFluidText': 'Brake Fluid',
          'batteryElctroText': 'Battery Electrolyte',
          'fuelText': 'Fuel',
          'leaksText': 'Leaks',
          'mastChainText': 'Mast Chains',
          'hydraulicDriveText': 'Hydraulic Drive',
          'hydraulicHosesText': 'Hydraulic Hoses',
          'mirrorsText': 'Mirrors',
          'pedalsText': 'Pedals',
          'tiresText': 'Tires',
          'forksText': 'Forks',
          'retroHornText': 'Retro horn',
          'flasherBeaconText': 'Flasher Beacon',
          'reviewButtonText': 'Send',
          'itemGoodText': 'Good',
          'itemBadText': 'Bad',
          'selectConditionText': 'Select Condition',
          'reviewText': 'Review',
          'inspectionDueText': 'Inspection Due:',
          'dueInspectionReport': 'Due Inspection Report',
          'noInspectionDueText': 'No Inspection Due',
          'selectValueText': 'Please select a value',
          'dataUploadSuccess': 'Data Uploaded Successfully',
          'dataUploadUnSuccess': 'Data Uploaded UnSuccessfully',
          'changelang': 'en',
          'statusText': 'Status',
          'dataUnauthenticatedText': 'Data Unauthenticated',
          'okText': 'OK',
          'DataFormatIncorrectText': 'Data format is incorrect',
          'congoText': 'Congratulations',
          'logoutText': 'Logout',
          'tryAgainText': 'Try Again',
          'noForkliftAssignText': 'No Forklift Assigned',
          'electricText': 'Electric',
          'nonElectricText': 'Internal Combustion',
          'brandText': 'Brand',
          'modelText': 'Model',
          'warehouseText': 'Warehouse',
          'registrationNumberText': 'Registration Number',
          'registrationDateText': 'Registration Date',
          'typeText': 'Type',
          'seriesText': 'Series',
  'selectOptionText': 'Please Select All Options',
        },
        'es_SP': {
          'signin': 'Iniciar sesión',
          'buttonTextSignIn': 'INICIAR SESIÓN',
          'emailLabelText': 'Correo electrónico',
          'emailHintText': 'Introduce tu correo electrónico',
          'passwordLabelText': 'Contraseña',
          'passwordHintText': 'Ingresa tu contraseña',
          'validEmailText': 'Introduce tu correo electrónico',
          'validEmailText1': 'Ingrese un email valido',
          'validPasswordText': 'Ingresa tu contraseña',
          'validPasswordText1': 'No coincide',
          'loginSuccessSnackBarText': 'Inicio de sesión exitosa',
          'loginSuccessSnackBarText2': 'Bienvenida',
          'loginFailSnackBarText': 'Error de inicio de sesion',
          'loginFailSnackBarText2':
              'Correo electrónico o contraseña no válidos',
          'loginExceptionSnackBarText2': 'Ocurrió un error al iniciar sesión',
          'logoutSuccessSnackBarText': 'Cierre de sesión exitoso',
          'logoutSuccessSnackBarText2': 'Adiós',
          'logoutFailSnackBarText': 'Cierre de sesión fallido',
          'logoutExceptionSnackBarText2':
              'Ocurrió un error al cerrar la sesión',
          'AppBarDashboardText': 'Inicio',
          'AppBarInspectionText': 'Inspección',
          'AppBarCustomInspectionText': 'Inspección personalizada',
          'AppBarProfileText': 'Perfil',
          'AppBarInspectionText1': 'Reporte de inspección',
          'radiatorLevelText': 'Nivel del radiador',
          'engineOilText': 'Aceite de motor',
          'hydraulicOilText': 'Aceite hidráulico',
          'brakeFluidText': 'Líquido de los frenos',
          'batteryElctroText': 'Electrolito de batería',
          'fuelText': 'Combustible',
          'leaksText': 'Fugas',
          'mastChainText': 'Cadenas de mástil',
          'hydraulicDriveText': 'Accionamiento hidráulico',
          'hydraulicHosesText': 'Mangueras hidráulicas',
          'mirrorsText': 'Espejos',
          'pedalsText': 'Pedales',
          'tiresText': 'Llantas',
          'forksText': 'Tenedoras',
          'retroHornText': 'Cuerno retro',
          'flasherBeaconText': 'Baliza intermitente',
          'reviewButtonText': 'Enviar',
          'itemGoodText': 'Buena',
          'itemBadText': 'Mala',
          'changelang': 'es',
          'inspectionDueText': 'Inspección pendiente:',
          'selectConditionText': 'Seleccionar condición',
          'dueInspectionReport': 'Informe de Inspección Vencida',
          'noInspectionDueText': 'Sin inspección pendiente',
          'reviewText': 'Revisar',
          'selectValueText': 'Por favor seleccione un valor',
          'dataUploadSuccess': 'Datos cargados con éxito',
          'dataUploadUnSuccess': 'Datos cargados sin éxito',
          'congoText': 'Felicidades',
          'dataUnauthenticatedText': 'Datos no autenticados',
          'okText': 'DE ACUERDO',
          'logoutText': 'Cerrar sesión',
          'statusText': 'Estado',
          'DataFormatIncorrectText': 'El formato de datos es incorrecto',
          'tryAgainText': 'Intentar otra vez',
          'noForkliftAssignText': 'Sin carretilla elevadora asignada',
          'electricText': 'Eléctrica',
          'nonElectricText': 'Combustión interna',
          'brandText': 'Marca',
          'modelText': 'Modelo',
          'warehouseText': 'Depósito',
          'registrationNumberText': 'Número de registro',
          'registrationDateText': 'Fecha de Registro',
          'typeText': 'Tipo',
          'seriesText': 'Serie',
          'selectOptionText': 'Seleccione todas las opciones',
        },
      };
}
