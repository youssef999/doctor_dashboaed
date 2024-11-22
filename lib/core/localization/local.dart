// ignore_for_file: equal_keys_in_map

import 'package:get/get.dart';

class MyLocal implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "serviceName": "اسم الخدمة",

          "noServices": "لا يوجد خدمات ",

          "wrongPass": "كلمة مرور خطا",

          "wrongMail": "البريد خطا ",

          "logout": "تسجيل خروج",

          "aboutUs": "اعرف عنا ",

          "payError": "خطأ في عملية الدفع",
          "payDone": "تم الدفع بنجاح ",
          "freelancer": "عامل حر",
          "selectAccType": "اختر نوع الحساب ",

          "changeStatusDone": "تم تغيير حالة الطلب ",

          "dealSent": "تم ارسال الصفقة بنجاح",

          "user": 'مستخدم',
          "myServices": "خدماتي",
          "orderRequests": "الطلبات المرسلة ",
          "addNewService": "اضف خدمة جديدة",
          "myOrders": "طلباتي ",

          "taskDone": "هل تم تنفيذ الطلب بنجاح؟",

          "taskFinished": "هل تم تنفيذ الطلب بنجاح؟",

          "makeComment": "تعليقك عن الخدمة",

          "serviceProviders": "مقدمي الخدمات ",

          "comment": "التعليق",

          "startFrom": "سعر الخدمة يبدا من : ",

          "servicePrice": "سعر الخدمة",
          "serviceUpdate": "تم تعديل الخدمة",
          'serviceDetails': "وصف الخدمة",
          "selectCat": 'اختر القسم',
          'addService': "اضافة خدمة",
          "search": 'بحث',
          "email": 'البريد الالكتروني',
          "password": 'كلمة المرور',
          "login": 'تسجيل الدخول',

          "register": 'إنشاء حساب',

          "addServiceImage": "اضافة صورة الخدمة",

          "edit": "تعديل",
          "delete": "حذف",
          "add": "اضافة",
          "editServiceImage": "تعديل صورة الخدمة",

          "selectCountry": "اختر الدولة",

          "from": "طلبت الخدمة من : ",

          "date": "تاريخ الطلب ",
          "taskTime": "المدة المتوقعة ",
          "price": "سعر الطلب ",
          "status": "حالة الطلب ",
          "refuse": "رفض ",
          "accept": "موافقة ",

          "requestMoney": "طلب سحب الاموال",

          "mustDealSellerBeforeBuy": "يجب عليك الاتفاق مع البائع قبل الشراء ",

          "wallet": "الرصيد ",

          "refused": "الطلب مرفوض ",

          "changeLang": "تغيير اللغة ",
          "changePass": "تغيير كلمة المرور ",

          "editDataAndSendToClient": "تعديل بيانات اساسية بالصفقة  ",

          "updateData": "تعديل البيانات ",

          "freelancers": "عاملين عن بعد ",

          "buyService": " اشتري الخدمة ",

          "des": "   وصف الصفقة بالتفصيل",
          "avgTime": "مدة التنفيذ المتوقعة ",
          "sendOffer": "ارسل الصفقة الان ",

          "allServices": "جميع العقارات ",

          "seeAll": "المزيد ",

          "userName": "الاسم ",

          "services": "العقارات",

          "priv": '''
          
سياسة الخصوصية:
                             
المعلومات: يوفر هذا التطبيق معلومات حول العقارات لأغراض إعلامية فقط. في حين أننا نسعى جاهدين لضمان دقة المعلومات، فإننا لا نضمن دقتها أو اكتمالها أو موثوقيتها. يجب على المستخدمين التحقق بشكل مستقل من أي معلومات قبل اتخاذ أي قرارات.
المحتوى الذي ينشئه المستخدم: لا يتحمل التطبيق مسؤولية المحتوى الذي ينشئه المستخدمون، مثل التعليقات أو التقييمات.

الروابط الخارجية: قد يحتوي التطبيق على روابط لمواقع ويب خارجية. نحن لسنا مسؤولين عن محتوى أو ممارسات الخصوصية لهذه المواقع.

قرارات المستخدم: يتخذ المستخدمون قراراتهم الخاصة بناءً على المعلومات الواردة في التطبيق. نحن لسنا مسؤولين عن أي خسائر أو أضرار ناتجة عن هذه القرارات.

الشروط والأحكام:
قبول الشروط: باستخدام هذا التطبيق، فإنك توافق على الالتزام بهذه الشروط والأحكام.

الأهلية: يجب أن يكون عمرك 18 عامًا أو أكثر لاستخدام هذا التطبيق.

حساب المستخدم: أنت مسؤول عن الحفاظ على سرية معلومات حسابك.

استخدام التطبيق: يجب عليك استخدام التطبيق وفقًا للقوانين المعمول بها في دولة الكويت

المحتوى المحظور: لا يجوز لك نشر أو تحميل أي محتوى غير قانوني أو مسيء أو ضار.

الملكية الفكرية: جميع المحتويات في التطبيق، بما في ذلك النصوص والرسومات والشعارات، هي ملك لنا أو مرخصة لنا.

تعديل الشروط: يجوز لنا تعديل هذه الشروط والأحكام في أي وقت.
إنهاء الخدمة: يجوز لنا إنهاء حسابك أو الوصول إلى التطبيق في أي وقت ولأي سبب.

التعويض: أنت توافق على تعويضنا عن أي مطالبات أو أضرار ناتجة عن استخدامك للتطبيق.
القانون الحاكم: تخضع هذه الشروط والأحكام وتفسر وفقًا لقوانين الكويت.

إخلاء المسؤولية عن الضمان: يتم توفير هذا التطبيق "كما هو" دون أي ضمانات من أي نوع.

           
''',

          "country": "البلد",

          "noOrders": "لا توجد طلبات ",

          "checkLink": "تاكد من تفعيل البريد ",

          "checkLink2": "تم ارسال رابط التفعيل الي بريدك الالكتروني ",

          "camera": "كاميرا ",

          "gallery": "معرض الصور",

          "sentLargeFilesAsLink": "ارسل الملفات علي هيئة رابط",

          "selectLocation": 'قم بتحديد موقعك',

          "near": "مقدمين خدمات بالقرب منك ",

          "addIdImage": "إثبات الهوية",

          "cancel": "إلغاء",

          "next": "التالي",

          "city": "الولاية",

          "noService": "لا خدمات ",

          "price2": "سعر خدماتك يبدا من : ",

          "finish": "تم التنفيذ",

          "finshed": "تم التنفيذ",

          "taskError": "لا لم يتم التنفيذ بنجاح",

          "yes": 'نعم',

          "no": 'لا',

          "cancel": "الغاء",

          "canceled": "تم الغاء الطلب",

          "pending": "جاري التنفيذ",
          "chat": "الدردشة",
          "approved": "تمت الموافقة",
          "declined": "تم الرفض",

          "send": "ارسال",

          "done": "تم الارسال ",

          "about": '''
من نحن

نحن منصة عقارية رائدة، مهمتنا تمكين الباحثين عن العقارات والمستثمرين والمهنيين من خلال توفير معلومات شاملة ودقيقة وشفافة. نجمع بين أحدث التقنيات وخبرة السوق لنقدم تجربة مستخدم سلسة وموثوقة.
رؤيتنا

نسعى لأن نكون المرجع الأول والأكثر ثقة في عالم العقارات، من خلال توفير منصة شاملة تلبي جميع احتياجات المستخدمين، بدءًا من البحث عن العقار المثالي وحتى تحليل أداء السوق.
قيمنا

الشفافية: نؤمن بتقديم معلومات دقيقة ومحدثة وشفافة لجميع مستخدمينا.

الدقة: نستخدم أحدث التقنيات والتحليلات لضمان دقة البيانات والإحصائيات التي نقدمها.

الابتكار: نسعى دائمًا لتطوير وتحديث منصتنا لتلبية احتياجات السوق المتغيرة.

التميز في خدمة العملاء: نضع عملائنا في مقدمة أولوياتنا ونسعى لتقديم أفضل خدمة ممكنة.

للتواصل مع الادارة :

الايميل : DOCTORkwt@gmail.com
تلفون : 99211895


''',

          "forgotPassword": "نسيت كلمة المرور",

          "dontHaveAccount": 'ليس لديك حساب؟',

          "emailNotVerfied": "البريد غير مفعل ",

          "addProfileImage": "اضافة صورة شخصية",

          'or': "او",

          "enterPlace": "ادخل اسم المكان ",

          "search": "البحث",

          "loginNow": "انتقل لتسجيل الدخول ",

          "orderRequest": "الطلبات المرسلة ",

          "notes": "ملاحظات عن الصفقة ",

          "empType": "نوع الحساب ",

          "isEdit": "تم ارسال تعديلات علي الصفقة",

          "noChat": "لا توجد محادثات ",

          "addImage": "اضافة صور لشهاداتك و المؤهلات",

          "createNewAccount": "تسجيل حسابك ",

          "myServices": "خدماتي ",

          "enterAmount": "ادخل المبلغ",

          "settings": "الاعدادات ",

          "online": "عامل حر عن بعد ",

          "offline": "مقدم خدمة تحتاج لوجوده ",

          "enterEmail": "ادخل بريدك الاكلتروني علي باي بال",
          //:"ادخل البريد الالكتروني",

          "orderChangedSentToClient": "تم ارسال التعديلات للعميل ",

          "orderChangedSentToClient": "تم ارسال تعديلات الصفقة للعميل ",

          "taskFinish": "تم إنهاء الصفقة بنجاح",

          "privacy": "سياسة الخصوصية",

          "total": "الاجمالي",

          "pay": "ادفع الان ",

          "comments": "التعليقات",

          "requestSent": "تم الارسال ",

          "location": "عنوان بالتفصيل",

          "cat": "القسم ",

          "home": "رئيسية",

          // ignore: equal_keys_in_map
          "addService": "اضف خدمة جديدة ",

          "phoneNumber": "رقم الهاتف",

          "serviceDone": "تم اضافة الخدمة بنجاح",

          "empCat": "التخصص ",

          "minRequest": "الحد الادني للسحب ١٠ "
        },
        "en": {
          "serviceDone": "Service Done",

          "minRequest": "Minimum Request 10 ",

          "enterPlace": "Enter Place",

          "empCat": "Specialization",

          "selectLocation": 'Select Location',

          "home": "Home",

          "addService": "Add Service",

          "requestSent": "Request Sent",

          "search": "Search",

          "wrongPass": "Wrong Password",

          "wrongMail": "Wrong Mail ",

          "sentLargeFilesAsLink": "Sent Large Files As A Link",

          "next": "Next",

          "createNewAccount": "Create New Account ",

          "location": "Your Location",

          "noServices": "No Services",

          "notes": "Notes ",

          "orderRequest": "Order Request ",

          "logout": "Logout",

          "aboutUs": "About Us",

          "price2": "services price start from : ",

          "finish": "Finish",

          "done": "Done",

          "privacy": "Privacy",

          "taskFinish": "Task Finished",

          "loginNow": "Go To Login ",

          "emailNotVerfied": "Email Not Verified",

          "finshed": "Order Finished",

          "taskDone": "Done",

          "cancel": "Cancel",

          "noService": "No Services ",

          "canceled": "Order Canceled",

          "makeComment": "Make Comment",

          "allServices": "All Services",

          "seeAll": "See All",

          "comment": "Comment",

          "yes": 'Yes',
          "no": 'No',

          "dealSent": "Deal Sent ",

          "isEdit": "Changes to the deal have been sent",

          "camera": "Camera ",

          "gallery": "Gallery",

          "about": '''
who are we

We are a leading real estate platform, our mission is to empower property seekers, investors and professionals by providing comprehensive, accurate and transparent information. We combine the latest technology and market expertise to deliver a seamless and reliable user experience.
Our vision

We seek to be the first and most trusted reference in the world of real estate, by providing a comprehensive platform that meets all user needs, from searching for the ideal property to analyzing market performance.
rate us

Transparency: We believe in providing accurate, up-to-date and transparent information to all our users.

Accuracy: We use the latest technologies and analytics to ensure the accuracy of the data and statistics we provide.

Innovation: We always strive to develop and update our platform to meet changing market needs.

Excellence in customer service: We put our customers at the top of our priorities and strive to provide the best possible service.

To contact the administration:

Email: DOCTORkwt@gmail.com
Phone: 99211895

''',

          "cancel": "Cancel",

          "loginNow": "Aller à la connexion",

          "checkLink": "Vérifier le courriel",

          "checkLink2":
              "Nous avons envoyé un lien de vérification pour activer votre compte",

          "near": "Fournisseur de services à proximité",

          "editDataAndSendToFreelancer": "Edit Deal Data ",

          "date": "Date",
          "taskTime": "expected time",
          "orderChangedSentToClient": "Changes sent to client",
          "price": "Order Price",
          "status": "Status",
          "refuse": "Refuse",
          "accept": "Accept",

          "addProfileImage": "Add Profile Image",

          "taskError": "The deal was not executed successfully",

          "edit": 'Edit',
          "freelancers": "Remote Freelancers",
//orderChnagedSentToClient
          "orderChangedSentToClient": " Order Changes Sent To Client ",

          "serviceProviders": "Service providers",

          "comments": "Comments",

          "changeLang": "Change Language",
          "changePass": "Change Password",

          "settings": "Settings",

          "noChat": " No Chat ",

          "cat": "Category",

          "addImage": "Add Images For Certificates and Qualifications",

          "startFrom": " Starts From : ",

          "userName": " Name",

          "noOrders": "No Orders ",

          "country": "Country",

          "chat": "Chat",

          "buyService": "Buy Service ",

          "phoneNumber": "phone Number",

          "pending": "InProgress",

          "approved": "Approved",
          "declined": "Declined",

          "myServices": "My Services",

          "forgotPassword": "Forgot Password",

          "dontHaveAccount": 'Don\'t have an account?',

          'or': "OR",

          "des": " Descripe the deal in detail",
          "avgTime": " Expected Execution Time ",
          "sendOffer": "Send Offer ",

          "dealSent": "Deal Sent ",

          "myServices": "My Service ",
          "orderRequests": "Order Request ",
          "addNewService": "Add New Service ",
          "myOrders": "My Orders ",
          "serviceName": "Service Name",
          "editServiceImage": "Edit Service Image",
          "servicePrice": "Service Price",
          'serviceDetails': "Service Details",
          "serviceUpdate": "Service Updated",
          "selectCat": 'Select Category',
          'addService': "Add Service",
          "search": 'Search',
          "email": 'Email',
          "password": 'Password',

          "empType": "Account Type",
          "login": 'Login',
          "register": 'Register',
          "addServiceImage": "Add Service Image",
          "changeStatusDone": "Order Status Changed",

          "online": " Remote worker ",
          "offline": "A service provider you need to have ",

          "send": 'Send',

          "services": "Real State",

          "delete": "Delete",
          "add": "Add",
          "selectCountry": "Select Country",
          "freelancer": "Freelancer",
          "user": 'User',

          "selectAccType": "Select Account Type",
          "from": "Service requested from : ",

          "editDataAndSendToClient": "Edit Data And Send To Client",

          "mustDealSellerBeforeBuy": "Must Deal With Seller Before Buy",

          "updateData": "Update Data",

          "city": "City",

          "requestMoney": "Request Money",

          "enterAmount": "Enter Amount",

          "enterEmail": "Enter Paypal Email",

          "refused": "Refused",
          "wallet": " Wallet ",
        },
        "fr": {
          "cat": "Catégorie",
          "serviceDone": "Service effectué",

          "minRequest": "Demande minimale 10 ",

          "enterPlace": "Entrez le lieu",

          "empCat": "Spécialisation",

          "selectLocation": "sélectionnez l'emplacement",

          "home": "Maison",

          "addService": "Ajouter un service",

          "wrongPass": "Wrong Password",

          "wrongMail": "Wrong Mail ",

          "requestSent": "Demande envoyée",

          "search": "Recherche",

          "next": "Suivant",

          "createNewAccount": "Créer un nouveau compte ",

          "location": "Votre emplacement",

          "notes": "Remarques",

          "orderRequest": "Demande de commande ",

          "finish": "Finition",

          "priv": '''
        
privacy policy:
                             
Information: This application provides information about real estate for informational purposes only. While we strive to ensure the accuracy of the information, we do not warrant its accuracy, completeness or reliability. Users should independently verify any information before making any decisions.
User-Generated Content: The application is not responsible for user-generated content, such as comments or ratings.

External Links: The Application may contain links to external websites. We are not responsible for the content or privacy practices of these sites.

User Decisions: Users make their own decisions based on the information provided in the application. We are not responsible for any losses or damages resulting from these decisions.

Terms and Conditions:
Acceptance of Terms: By using this application, you agree to be bound by these terms and conditions.
Eligibility: You must be 18 years or older to use this app.
User Account: You are responsible for maintaining the confidentiality of your account information.
Use of the Application: You must use the Application in accordance with the laws in force in the State of Kuwait
Prohibited Content: You may not post or upload any illegal, offensive or harmful content.
Intellectual Property: All content in the application, including texts, graphics and logos, is our property or licensed to us.
Modification of Terms: We may amend these terms and conditions at any time.
Termination of Service: We may terminate your account or access to the Application at any time and for any reason.
Indemnification: You agree to indemnify us for any claims or damages resulting from your use of the application.
Governing Law: These terms and conditions shall be governed by and construed in accordance with the laws of Kuwait.
Disclaimer of Warranty: This application is provided "as is" without any warranties of any kind.


        ''',

          "done": "Fait",

          "taskFinish": "Tâche terminée",

          "finshed": "Commande terminée",

          "taskDone": "tâche accomplie",

          "cancel": "Annuler",

          "noService": "Aucun service ",

          "canceled": "Commande annulée",

          "makeComment": "Faire un commentaire",

          "allServices": "Tous les services",

          "seeAll": "Voir tout",

          "comment": "Commentaire",

          "price2": "services price start from : ",

          "yes": 'Oui',

          "no": 'Non',

          "phoneNumber": 'numéro de téléphone',

          "dealSent": "Offre envoyée ",

          "noServices": "Aucun service",

          "isEdit": "Les modifications apportées à l'accord ont été envoyées",

          "camera": "Caméra",

          "gallery": "Galerie",

          "cancel": "Annuler",

          "editDataAndSendToFreelancer":
              "Modifier les données de la transaction",

          "date": "Date",
          "taskTime": "heure prévue",
          "orderChangedSentToClient": "Modifications envoyées au client",

          "price": "Prix ​​de la commande",

          "status": "Statut",

          "total": "Total",

          "refuse": "Refuser",

          "accept": "Accepter",

          "addProfileImage": "Ajouter une image de profil",

          "taskError": "La transaction n'a pas été exécutée avec succès",

          "edit": 'Modifier',
          "freelancers": "Freelances à distance",
//orderChnagedSentToClient
          "orderChangedSentToClient":
              " Modifications de commande envoyées au client ",

          "serviceProviders": "Les fournisseurs de services",

          "comments": "commentaires",

          "changeLang": "Changer de langue",

          "changePass": "Changer le mot de passe",

          "settings": "Paramètres",

          "noChat": "Pas de message texte",

          "addImage":
              "Ajouter des images pour les certificats et les qualifications",

          "startFrom": " Commence à partir de : ",

          "userName": " Nom",

          "noOrders": "Aucune commande ",

          "country": "Pays",

          "chat": "Chat",

          "buyService": "Acheter un service",

          "pending": "En cours",

          "approved": "Approuvé",

          "privacy": "Confidentialité",

          "declined": "Diminué",

          "myServices": "Mes services",

          "forgotPassword": "Mot de passe oublié",

          "dontHaveAccount": "Vous n'avez pas de compte ?",

          'or': "OU",

          "des": " Décrivez l'accord en détail",
          "avgTime": " Temps d'exécution prévu ",
          "sendOffer": "Envoyer une offre ",

          "dealSent": "Offre envoyée ",

          "myServices": "Mon service ",
          "orderRequests": "Demande de commande ",
          "addNewService": "Ajouter un nouveau service ",
          "myOrders": "Mes commandes ",

          "serviceName": "Nom du service",
          "editServiceImage": "Modifier l'image du service",
          "servicePrice": "Prix ​​des services",
          'serviceDetails': "Détails des services",
          "serviceUpdate": "Service mis à jour",
          "selectCat": 'Choisir une catégorie',
          'addService': "Ajouter un service",
          "search": 'Recherche',
          "email": 'E-mail',
          "password": 'Mot de passe',

          "addIdImage": "Proof of identity",

          "empType": "Type de compte",
          "login": 'Se connecter',
          "register": 'Registre',
          "addServiceImage": "Ajouter une image de service",
          "changeStatusDone": "Statut de la commande modifié",

          "online": " Travailleur à distance ",
          "offline": "Un fournisseur de services dont vous avez besoin ",

          "send": 'Envoyer',

          "services": "Prestations de service",

          "delete": "Supprimer",
          "add": "Ajouter",
          "selectCountry": "Choisissez le pays",
          "freelancer": "Freelance",
          "user": 'Utilisatrice',
          "selectAccType": "Sélectionnez le type de compte",
          "from": "Service demandé à : ",

          "editDataAndSendToClient":
              "Modifier les données et les envoyer au client",

          "mustDealSellerBeforeBuy":
              "Doit traiter avec le vendeur avant d'acheter",

          "updateData": "Mettre à jour les données",

          "city": "Ville",

          "pay": "Payez maintenant",

          "payError": "Erreur de paiement",

          "payDone": "Payer avec succès",

          "requestMoney": "Demande de l'argent",

          "aboutUs": 'à propos de nous',

          "logout": "Se déconnecter",

          "about": '''

Easy est une application de services destinée aux personnes ayant des besoins spéciaux et aux prestataires de services de plusieurs catégories

Cette plateforme s'entend en reliant contactez-moi entre

Les professionnels, entrepreneurs et porteurs de projets proposent des services moins utiles et moins coûteux grâce à notre application électronique, où ils ont la possibilité de choisir et de négocier avec plusieurs spécialistes et prestataires de services en même temps et de choisir les meilleurs différents prestataires de services au moindre coût, plus généralité et effort moins évident.

Rappelez-vous certains des avantages de l'application, car elle met à disposition deux agents qui fournissent des services généraux, des services d'entretien à domicile, des services de livraison, des services de santé et techniques, divers services artisanaux et d'autres services.

Tâche d'application : interaction entre l'utilisateur qui a besoin du service et la partie fournissant le service

Fièrement fabriqué en Algérie
      ''',

          "enterAmount": "Entrer le montant",

          "enterEmail": "EEntrez l'e-mail Paypal",

          "emailNotVerfied": "email non vérifié",

          "refused": "Refusé",
          "wallet": " Portefeuille ",

          "priv":
              '''Nous accordons une grande importance à la confidentialité de nos utilisateurs. Aucune donnée personnelle n'est collectée sans consentement explicite. Les informations des utilisateurs sont utilisées uniquement pour fournir les services demandés. Nous ne partageons pas les données personnelles avec des tiers. Les utilisateurs ont le droit de supprimer leurs informations à tout moment. Nous prenons des mesures pour sécuriser les données des utilisateurs. Les communications sont chiffrées pour protéger la confidentialité. Les utilisateurs ont un contrôle total sur leurs données personnelles. Nous respectons les lois en vigueur en matière de protection des données. Les utilisateurs peuvent contacter le support pour toute question concernant la confidentialité.
        ''',
        }
      };
}
