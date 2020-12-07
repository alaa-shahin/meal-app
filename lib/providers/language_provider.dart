import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  bool isEn = true;

  Map<String, Object> textsAr = {
    "start": "أبدأ الان",
    "Tap back again to leave": "أضغط مرة أخري للمغادرة",
    'Saved successfully': 'تم الحفظ',
    "drawer_name": "عالم الطبخ",
    "drawer_item1": "الوجبات",
    "drawer_item2": "فلتر",
    "drawer_item3": "المظهر",
    "drawer_switch_title": "اختر لغتك",
    "drawer_switch_item1": "الانجليزية",
    "drawer_switch_item2": "العربية",
    "theme_appBar_title": "نمط التطبيق",
    "theme_screen_title": "قم بتعديل أنماط تطبيقك",
    "theme_mode_title": "أختر مظهر لتطبيقك",
    "System_default_theme": "مظهر الجهاز الافتراضي",
    "light_theme": "المظهر الفاتح",
    "dark_theme": "المظهر الداكن",
    "primary": "أختر اللون الاساسي",
    "accent": "أختر اللون الثانوي",
    "filters_appBar_title": "فلاترك",
    "Save": "حفظ",
    "filters_screen_title": "قم بتعديل فلاتر تطبيقك",
    "Gluten-free": "خالي من الكلوتين",
    "Gluten-free-sub": "يتضمن فقط الاطعمة الخالية من الكلوتين",
    "Lactose-free": "خالي من اللاكتوز",
    "Lactose-free_sub": "يتضمن فقط الاطعمة الخالية من مشتقات الحليب",
    "Vegetarian": "نباتي",
    "Vegetarian-sub": "يتضمن الاطعمة الخالية من المنتجات الحيوانية",
    "Vegan": "نباتي",
    "Vegan-sub": "يتضمن فقط الاطعمة الخالية من المنتجات الحيوانية ومشتقاتها",
    "categories": "التصنيفات",
    "your_favorites": "أطعمتك المفضلة",
    "cat-c1": "أيطاليا",
    "cat-c2": "أسبانيا",
    "cat-c3": "فرنسا",
    "cat-c4": "اليونان",
    "cat-c5": "بريطانيا",
    "cat-c6": "الصين",
    "cat-c7": "الهند",
    "cat-c8": "اليابان",
    "cat-c9": "تايلاند",
    "cat-c10": "الولايات المتحدة الامريكية",
    "Complexity.Simple": "سهلة",
    "Complexity.Challenging": "متوسطة",
    "Complexity.Hard": "صعبة",
    "Affordability.Affordable": "غير مكلفة",
    "Affordability.Pricey": "مكلفة",
    "Affordability.Luxurious": "باهضة الثمن",
    "min": "دقيقة",
    "min2": "دقائق",
    "meal-m1": "لازانيا باللحم المفروم",
    "meal-m2": "ريزوتو",
    "meal-m3": "سباغيتي كربونارا",
    "meal-m4": "الجمبري بالزبدة و الثوم",
    "meal-m5": "سلطة نيسواز",
    "meal-m6": "حلوي لوكوماديس",
    "meal-m7": "بودينغ الشوكولاتة",
    "meal-m8": "دجاج بالكاري الهندي بالكريمة",
    "meal-m9": "دجاج بالسمسم",
    "meal-m10": "سلطة الهليون مع الطماطم الكرزية",
    "meal-m11": "سوشي",
    "meal-m12": " أرز تايلاندي بالمانجو",
    "Ingredients": "المكونات",
    "Steps": "الخطوات",
    "favorites_text":
        "لم تقم بأضافة طعام مفضل لحد الآن - قم بأضافة بعض الاطعمة!",
    "ingredients-m1": [
      " شرائح لازانيا",
      "500 جرام لحم مفروم",
      "حبتين بصل مفروم",
      " حبيتين ثوم مفروم",
      "كوب جبنة موتزاريلا مبروشة",
      "1/2كوب جبنة بارميزان مبروشة",
      "كوب صلصة طماطم",
      "ملعقة كبيرة معجون طماطم",
      " 100 جرام زبدة",
      "ملعقة صغيرة ريحان",
      "1/2ملعقة صغيرة فلفل أسود",
      "رشة ملح",
    ],
    "ingredients-m2": [
      "3 كوب ماء",
      " 2 كوب وثلث مرق الدجاج",
      "ربع كوب زبدة",
      "نصف بصلة مفرومة",
      "كوب أرز",
      "نصف كوب كريمة طهي",
      "ربع كوب جبن بارميزان مبشور",
      "ملح وفلفل حسب الرغبة",
      "بقدونس مفروم للتزيين",
    ],
    "ingredients-m3": [
      "بيكون حبش مقطّع - 100 غرام",
      "جبن بارميزان - 100 غرام",
      "بيض - 3",
      "معكرونة سباغيتي رفيعة - 350 غرام",
      "ثوم مقّشر - فصّان",
      "زبدة غير مملّحة - 50 غرام",
      "ملح - بحسب الرغبة",
      "فلفل - بحسب الرغبة",
    ],
    "ingredients-m4": [
      "8 ملعقة كبيرة زبدة",
      '3/4 كيلو جمبري',
      "ملح",
      "فلفل اسود مطحون",
      "5 فص ثوم مفروم",
      "1/4 كوب شوربة دجاج",
      '1 ليمونة معصورة',
      '2 ملعقة كبيرة بقدونس مقطع',
    ],
    "ingredients-m5": [
      'الخل : 2 ملعقة كبيرة ',
      "زيت الزيتون : 2 ملعقة كبيرة ",
      'الخردل : ملعقة كبيرة ',
      ' ملح : حسب الرغبة ',
      "البهار الأبيض : حسب الرغبة  ",
      ' خس الآيسبرغ : رأس ',
      'لبطاطس : 200 غم (مسلوقة ومُقطَّعة) ',
      'بندورة : 200 غم (مُقطَّعة إلى شرائح) ',
      '  فليفلة ملونة : 100 غراماً (مُقطَّعة إلى شرائح)',
      ' البصل : 2 حبة (مسلوق ومُقشَّر)',
      'التونا : 2 عبوة (محفوظة في الماء) ',
      'زيتون أسود : 50 غم ',
      ' بقدونس : ملعقة كبيرة (مفرومًا فرمًا ناعمًا / اختياري)  ',
    ],
    "ingredients-m6": [
      " 1 كوب دقيق",
      " 0.5 ملعقة كبيرة نشاء ذرة",
      " 1  ملعقة صغيرة خميرة",
      " 1  ملعقة قرفة ناعمة",
      " 1 كوب ماء",
      " 1  ملعقة صغيرة ملح",
      "  جوز مبشور, قرفة وعسل للتّزيين",
      " 2  أكواب زيت ذرة للقلي",
    ],
    "ingredients-m7": [
      " سكر : ثلث كوب ",
      "  بودرة الكاكاو : ربع كوب ",
      "  النشاء : 3 ملاعق كبيرة ",
      "  ملح : ربع ملعقة صغيرة ",
      "  حليب : كوبان ",
      " الفانيليا : ملعقة صغيرة ",
    ],
    "ingredients-m8": [
      " سكر : ثلث كوب ",
      "  بودرة الكاكاو : ربع كوب ",
      "  النشاء : 3 ملاعق كبيرة ",
      "  ملح : ربع ملعقة صغيرة ",
      "  حليب : كوبان ",
      " الفانيليا : ملعقة صغيرة ",
    ],
    "ingredients-m9": [
      "6 قطع صدور دجاج خالية من العظم",
      "نصف كوب عسل",
      "نصف كوب صويا صوص",
      "كوب ماء",
      "معلقتان كبيرتان من دقيق نشا الذرة",
      "ملعقة ونصف صغيرة من الزنجبيل",
      "ملعقة من البابريكا",
      "ملعقة كبيرة من السمسم المحمص",
    ],
    "ingredients-m10": [
      "الهليون الأبيض والأخضر",
      "30 جرام صنوبر",
      "300 جرام من الطماطم الكرز",
      'سلطة',
      "ملح وفلفل وزيت زيتون",
    ],
    "ingredients-m11": [
      "3 أكواب من الأرز الياباني",
      "3/4 كوب من الماء",
      "1/3 كوب خل الأرز",
      '3 ملاعق كبيرة من السكر',
      "1 ملعقة صغيرة ملح",
      "8  أوراق من الأعشاب البحرية ",
      "حشوات متنوعة من اختيارك من خضار وأسماك.",
    ],
    "ingredients-m12": [
      "400 جم  حليب جوز هند",
      "1/2 كوب أرز بسمتي (أو أرز ياسمين)",
      "1/2 كوب سكر",
      '1 ثمرة مانجو مقطع شرائح',
    ],
    "steps-m1": [
      "يتم تحضير البشاميل من خلال وضع إناء على النار، ثم نذوب فيه مكعبات الزبد، ونضيف الدقيق، ويقلب بملعقة خشب حتى يتشرب كل الزبد.",
      "نضع الحليب تدريجياً مع التقليب أثناء سكبه، حتى لا تأتى كتل داخل البشاميل، وعندما يصبح الخليط متجانس نغلق النار ونضع الفلفل الأسود والملح",
      " أما بالنسبة لحشوة اللازانيا، فنضع وعاء آخر على النار، ونذوب فيه مكعبات الزبدة، ثم يضاف البصل والثوم المفروم ويقلى حتى يذبل",
      "تضاف اللحمة وتقلى حتى يتغير لونها، ثم نتبلها بالقرفة، والفلفل الأسود والملح، وتقلب جيداً.",
      "نضيف صلصة ومعجون الطماطم، ونضع الماء على اللحمة وتترك على نار هادئة مع التحريك، حتى تنضج اللحمة كلياً ونرفعها من على النار.",
      "نحضر صينية فرن زجاجية، ونسكب طبقة من البشاميل، تغطى بطبقة من شرايح اللازانيا، وتوزع فوقها طبقة من الحشوة ثم طبقة اخرى من البشاميل وفوقها طبقة من جبنة الموتزاريلا، تكرر العملية حتى تنتهى الكمية.",
      " رش الجبن البارميزان على الوجه، ثم ندخل الصينية إلى الفرن، وتترك لمدة ما بين 25 إلى 30 دقيقة.",
      "  نخرجها من الفرن وتقدم ساخنة.",
    ],
    "steps-m2": [
      " سخّني الماء مع المرق على نار متوسطة حتى تغلي، خففي النار واتركيها على النار.",
      " اذيبي 2 ملعقة كيبرة زبدة في قدر على نار متوسطة واضيفي البصل وقلّبي حتى يذبل.",
      " اضيفي الأرز وقلّبي لمدة دقيقتين، ثم اضيفي ثلث كوب من مزيج المرق والماء، وقلّبي حتى يتم امتصاصه.",
      "ارفعي درجة حرارة النار واضيفي كوب آخر من المرق، ثم دعي القدر على النار بدون أن تغطيه حتى يتم امتصاص السوائل كلها.",
      " كرري هذه الخطوة بإضافة كوب من المرق في كل مرة والانتظار حتى يتم امتصاصها حتى تنتهي كمية المرق.",
      "  دعيه على النار لمدة 25 دقيقة حتى يصبح قوامه كالكريمة.",
      " اضيفي الكريمة، الجبنة، الملح والفلفل وباقي كمية الزبدة، قلّبي لمدة دقيقتين.",
      " زيّنيه بالبقدونس وقدميه.",
    ],
    "steps-m3": [
      "في وعاء، أخفقي البيض ثمّ رشّي الفلفل واخلطي. أتركي المزيج جانباً.",
      "ضعي قدراً من الماء على النار حتى الغليان.",
      " أضيفي ملعقة صغيرة من الملح إلى الماء المغلي.",
      " ضعي المعكرونة واتركيها حتى يغلي الماء من جديد.",
      " غطّي القدر واتركي المعكرونة حوالى 10 دقائق أو حتى تنضج.",
      " إهرسي الثوم قليلاً بواسطة الجهة الملساء من السكين.",
      " في مقلاة، ذوّبي الزبدة وقلّي البيكون مع الثوم حوالى 5 دقائق حى تنضج قطع الحبش.",
      "  أخرجي الثوم من المقلاة وخففي الحرارة تحت المقلاة.",
      "  عندما تنضج المعكرونة، أخرجيها بواسطة الملعقة المخصصة للمعكرونة وصفيّها من مائها ثمّ ضعيها في المقلاة فوق البيكون.",
      " أخلطي جبن البارميزان مع البيض المخفوق.",
      "  أطفئي النار تحت المقلاة.",
      " أسكبي خليط البيض فوق المعكرونة.",
      "  أخلطي المعكرونة ببعضها حتى تمتزج.",
      " نكّهي بالملح والفلفل بحسب الرغبة.",
      " قدّمي المعكرونة فوراًمع توزيع المزيد من الجبن والفلفل الأسود على الوجه.",
    ],
    "steps-m4": [
      "في مقلاة كبيرة على نار متوسطة ضعي 2 ملعقة كبيرة زبدة تسيح.",
      "ضعي الجمبري و الملح و الفلفل في الزبدة و قلبي بإستمرار حتى ينضج.",
      "ضعي الثوم في المقلاة على الجمبري لمدة 1 دقيقة ثم ضعي شوربة الدجاج و عصير الليمون و اتركي المزيج يغلي لمدة 2 دقيقة.",
      "ضعي باقي كمية الزبدة و قلبي حتى تذوب.",
      "قلبي الزبدة في الجمبري حتى تختلط جميع المكونات.",
      "ضعي الجمبري في طبق التقديم ثم زينية بالبقدونس و قدمية.",
    ],
    "steps-m5": [
      " لإعداد التتبيلة: تُخلط مكوِّنات التتبيلة معًا، وتُحفظ جانبًا، إلى حين الفراغ من إعداد السلطة. وهي تُسكب عند التقديم.  ",
      "يُغسل الخس، ويفرم فرمًا خشنًا، ويُضاف إلى قعر طبق التقديم.",
      "بعد تقشير البطاطس، هي تُسلق في قدر حاوية الماء المُضاف إليه الملح، حتَّى تنضج. ثمَّ، تُقطَّع إلى قطع متوسِّطة الحجم، فتُضاف إلى طبق التقديم.",
      " تُضاف التونة إلى الطبق، مع شرائح البندورة وحلقات البصل والزيتون والفليفلة",
      "يُقطَّع البيض المسلوق إلى أرباع، ويضاف إلى الطبق، الذي يُزيَّن بفرم البقدونس الناعم (اختياري).",
    ],
    "steps-m6": [
      "  في وعاء متوسط الحجم، انخلي الدقيق، نشاء الذرة, الخميرة والقرفة ثم اخلطي المكونات لتتجانس.",
      "   أضيفي الماء مع التحريك السريع حتى يتجانس المزيج، اتركيه جانباً ليرتاح لمدة ساعة حتى يتضاعف حجمه.",
      "  سخني الزيت في قدر على النار، خذي مقدار من المزيج بواسطة ملعقة كبيرة ثم أضيفيه إلى الزيت.",
      "  أعيدي الكرة حتى انتهاء الكمية ثم اتركي كرات الوكوماديس في الزيت حتى تصبح ذهبية اللون.",
      "  ضعيها في طبق التقديم وزينيها بالجوز, القرفة والعسل، ارفعي الوكوماديس من الزيت. ",
    ],
    "steps-m7": [
      "خلطي الكاكاو والسكر والنشا والملح في وعاء.",
      "أصيفي الحليب وقلبي حتى تتجانس المكونات وتذوب.",
      " سخني المزيج في قدر على النار حتى يبدأ بالغليان و يصبح المزيج كثيفاً.",
      " أضيفي الفانيلا وحركي.",
      "اسكبي المزيج في أطباق صغيرة، وأدخليه الثلاجة لمدة 3 ساعات على الأقل وقدميه بارداً.",
    ],
    "steps-m8": [
      "قطع صدر الدجاج إلى شرائح وقليها ،",
      "يُطحن البصل والثوم والزنجبيل إلى عجينة ويقلى كل شيء",
      "أضف البهارات وقلي القلي",
      " أضف صدور الدجاج + 250 مل من الماء واطبخ كل شيء لمدة 10 دقائق ،",
      "  أضف حليب جوز الهند ،",
      "  يقدم مع الأرز",
    ],
    "steps-m9": [
      "قطعي الدجاج الى مكعبات",
      'ادهني مقلاة طهو غير قابلة للإلتصاق بقليل من الزيت وسخنيها على حرارة متوسطة الى عالية.​​',
      "اطهي الدجاج لمدة 6 دقائق او الى تحول لونه للذهبي واختفاء اللون الوردي.",
      "إمزجي العسل مع الصويا صوص والماء ودقيق نشا الذرة والزنجبيل والبابريكا معاً.",
      "إخفقي الخليط لحين اختفاء دقيق الذرة.",
      "ضعي الخليط في المقلاة مع الدجاج.",
      "اطهي الدجاج والخليط معاً حتى يكثف.",
      "بإمكانك إضافة بعض الماء في حال لاحظت أن الخليط كثيف للغاية.",
      "رشي السمسم على الطعام.",
      "تغطى لمدة 10 دقائق على نار هادئة ليمتزج الخليط مع الدجاج ويمتص النكهة.",
    ],
    "steps-m10": [
      "اغسل وقشر واقطع الهليون ،",
      "طبخ في ماء مملح",
      "ملح وفلفل الهليون",
      "تحميص الصنوبر",
      "قطع الطماطم إلى نصفين",
      "تخلط مع الهليون والسلطة والتتبيلة",
      "تقدم مع الرغيف الفرنسي",
    ],
    "steps-m11": [
      "قم بغسل الأرز جيدًا ثم سلقه في الماء.",
      "عندما ينضج الأرز، اتركه لمدة 15 دقيقة.",
      "قم بخلط السكر والملح وخل الأرز في مقلاة على نار هادئة، إلى أن تتأكد من ذوبان كل من الملح والسكر تماماً، لتحصل على خليط السوشي.",
      "في وعاء كبير، قم بإضافة خليط السوشي على الأرز واتركه ليبرد.",
    ],
    "steps-m12": [
      "ايطهى الأرزحسب التعليمات على العبوة فقط نستبدل نصف الماء بحليب جوز الهند ونصف السكر .",
      "يجب أن لا يكون هناك اي سوائل في الأرز بعد ان ينضج.",
      "في إناء عميق يوضع باقي حليب جوز الهند و يوضع على نار متوسطة مع باقي السكر حتى يغلي.",
      "يترك الخليط يغلي مع التقليب المستمر حتى يصبح صوص سميك القوام قليلاً.",
      "قطع الطماطم إلى نصفين",
      "تخلط مع الهليون والسلطة والتتبيلة",
      "تقدم مع الرغيف الفرنسي",
    ],
  };
  Map<String, Object> textsEn = {
    "start": "GET STARTED",
    "Tap back again to leave": "Tap back again to leave",
    'Saved successfully': 'Saved successfully',
    "drawer_name": "Cooking Up!",
    "drawer_item1": "Meal",
    "drawer_item2": "Filters",
    "drawer_item3": "Themes",
    "drawer_switch_title": "Choose your language:",
    "drawer_switch_item1": "English",
    "drawer_switch_item2": "Arabic",
    "theme_appBar_title": "Your Themes",
    "theme_screen_title": "Adjust your themes selection.",
    "theme_mode_title": "Choose your Theme Mode",
    "System_default_theme": "System Default Theme",
    "light_theme": "Light Theme",
    "dark_theme": "Dark Theme",
    "primary": "Choose your primary color",
    "accent": "Choose your accent color",
    "filters_appBar_title": "Your Filters",
    "filters_screen_title": "Adjust your meal selection.",
    "Save": "Save",
    "Gluten-free": "Gluten-free",
    "Gluten-free-sub": "Only include gluten-free meals.",
    "Lactose-free": "Lactose-free",
    "Lactose-free_sub": "Only include Lactose-free meals.",
    "Vegetarian": "Vegetarian",
    "Vegetarian-sub": "Only include vegetarian meals.",
    "Vegan": "Vegan",
    "Vegan-sub": "Only include Vegan meals.",
    "categories": "Categories",
    "your_favorites": "Your Favorites",
    "cat-c1": "Italian",
    "cat-c2": "Spanish",
    "cat-c3": "French",
    "cat-c4": "Greek",
    "cat-c5": "British",
    "cat-c6": "Chinese",
    "cat-c7": "Indian",
    "cat-c8": "Japanese",
    "cat-c9": "Thailand",
    "cat-c10": "United States of America",
    "Complexity.Simple": "Simple",
    "Complexity.Challenging": "Challenging",
    "Complexity.Hard": "Hard",
    "Affordability.Affordable": "Affordable",
    "Affordability.Pricey": "Pricey",
    "Affordability.Luxurious": "Luxurious",
    "min": "min",
    "min2": "min",
    "meal-m1": "Lasagna With Minced Meat",
    "meal-m2": "Risotto",
    "meal-m3": "Spaghetti Carbonara",
    "meal-m4": "Shrimp with Butter and Garlic",
    "meal-m5": "Nisoaz salad",
    "meal-m6": "Sweet Locomades",
    "meal-m7": "Chocolate pudding",
    "meal-m8": "Creamy Indian Chicken Curry",
    "meal-m9": "Sesame chicken",
    "meal-m10": "Asparagus Salad with Cherry Tomatoes",
    "meal-m11": "Sushi",
    "meal-m12": "Thailand rice with mango",
    "Ingredients": "Ingredients",
    "Steps": "Steps",
    "favorites_text": "You have no favorites yet - start adding some!",
    "ingredients-m1": [
      'Lasagna slices',
      '500 gm ground beef',
      'Two onions, chopped',
      'Two minced garlic pieces',
      'A cup of shredded mozzarella cheese',
      '1/2 cup shredded parmesan cheese',
      'Tomato sauce cup',
      'A tablespoon of tomato paste',
      '100g butter',
      'A small spoon of basil',
      '1/2 teaspoon black pepper',
      'Pinch of salt',
    ],
    "ingredients-m2": [
      '3 cups of water',
      '2 cups and a third of chicken broth',
      'A quarter cup of butter',
      'Half an onion, chopped',
      'A cup of rice',
      'Half a cup of cooking cream',
      'A quarter cup grated Parmesan cheese',
      'salt and pepper as needed',
      'Chopped parsley, to garnish',
    ],
    "ingredients-m3": [
      'Bacon chopped turkey - 100 gr',
      'Parmesan cheese - 100 gr',
      'Eggs - 3',
      'Thin spaghetti pasta - 350 gr',
      'Peeled garlic - 2 lobes',
      'Unsalted butter - 50 gr',
      'Salt - to taste',
      'Pepper - to taste',
    ],
    "ingredients-m4": [
      '8 tablespoons butter',
      '3/4 kilo shrimp',
      'Ground black pepper',
      '5 minced garlic cloves',
      '1/4 cup chicken soup',
      '1 squeezed lemon',
      'Salt',
      '2 tablespoons of chopped parsley'
    ],
    "ingredients-m5": [
      'Vinegar: 2 tbsp',
      'Olive oil: 2 tbsp',
      'Mustard: a tablespoon',
      'Salt, to taste',
      'White pepper: as desired',
      'Iceberg lettuce: a head',
      'Potatoes: 200 gm (boiled and chopped)',
      'Tomato: 200 gm (cut into slices)',
      'Colored Capsicum: 100 grams (cut into slices)',
      'Onions: 2 tablets (boiled and peeled)',
      'Tuna: 2 cans (preserved in water)',
      'Black olives: 50 gm',
      'Parsley: 1 tablespoon (finely chopped / optional)',
    ],
    "ingredients-m6": [
      ' a cup of flour',
      '0.5  tablespoon of cornstarch',
      '1 teaspoon yeast',
      '1  spoon of soft cinnamon',
      '1 cup of water',
      '1 teaspoon salt',
      'Grated walnuts, cinnamon and honey, for garnishing',
      '2 cups corn oil for frying',
    ],
    "ingredients-m7": [
      'Sugar: 1/3 cup',
      'Cocoa powder: a quarter cup',
      'Starch: 3 tablespoons',
      'Salt: a quarter of a teaspoon',
      'Milk: 2 cups',
      'Vanilla: 1 teaspoon',
    ],
    "ingredients-m8": [
      '4 Chicken Breasts',
      '1 Onion',
      '2 Cloves of Garlic',
      '1 Piece of Ginger',
      '4 Tablespoons Almonds',
      '1 Teaspoon Cayenne Pepper',
      '500ml Coconut Milk',
    ],
    "ingredients-m9": [
      '6 pieces of boneless chicken breast',
      ' Half a cup of honey',
      ' Half a cup of soy sauce',
      'Cup water',
      'Two large tablespoons of cornstarch flour',
      'One and a half teaspoon of ginger',
      'Spoonful of paprika',
      'A tablespoon of roasted sesame',
    ],
    "ingredients-m10": [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    "ingredients-m11": [
      '3 cups of Japanese rice',
      '3/4 cup of water',
      '1/3 cup rice vinegar',
      '3 tablespoons of sugar',
      '1 teaspoon salt',
      '8 leaves of seaweed ',
      'Various fillings of vegetables and fish of your choice.',
    ],
    "ingredients-m12": [
      '400 gm of coconut milk',
      '1/2 cup basmati rice (or jasmine rice)',
      '1/2 cup basmati rice (or jasmine rice)',
      '1 mango, sliced',
    ],
    "steps-m1": [
      'The bechamel is prepared by placing a pot on the fire, then melting the butter cubes in it, adding the flour, and stirring with a wooden spoon until all the butter is absorbed.',
      ' Put the milk gradually, stirring while pouring it, so that no lumps come inside the bechamel, When the mixture becomes homogeneous, turn off the heat and add black pepper and salt',
      ' As for the lasagna filling, we put another bowl on the fire, and melt the butter cubes in it, then add the onion and chopped garlic and fry until soft.',
      'Add the meat and fry until it changes color, then season with cinnamon, black pepper and salt, and mix well.',
      'Add tomato paste and sauce, put water on the meat and leave it on a low heat with stirring, until the meat is completely cooked and removed from the fire.',
      'We prepare a glass oven tray, and pour a layer of bechamel, covered with a layer of lasagna slices, and spread a layer of the filling and then another layer of bechamel and above it a layer of mozzarella cheese, the process is repeated until the amount is finished.',
      'Sprinkle Parmesan cheese on top, then put the tray in the oven, and leave for 25 to 30 minutes.',
      ' Take it out of the oven and serve hot.',
    ],
    "steps-m2": [
      'Heat the water and broth over medium heat until it boils, reduce the heat and leave it on the stove.',
      'Melt 2 tablespoons of butter in a saucepan over medium heat, add onions, and stir until wilted.',
      'Add the rice and stir for two minutes, then add a third of a cup of the broth and water mixture, and stir until absorbed.',
      'Raise the heat on the stove and add another cup of broth, then put the saucepan on the stove without covering it until all the liquids are absorbed.',
      'Repeat this step by adding a cup of broth each time and waiting until it is absorbed until the amount of broth ends.',
      'Let it steep for 25 minutes, until it becomes creamy.',
      'Add the cream, cheese, salt, pepper and the rest of the butter, stir for two minutes.',
      'Garnish with parsley and serve.',
    ],
    "steps-m3": [
      'In a bowl, beat the eggs, then sprinkle with pepper and mix. Leave the mixture aside.',
      'Put a pot of water on the fire until it boils.',
      'Add a teaspoon of salt to boiling water.',
      'Put the pasta and leave it until the water boils again.',
      'Cover the pot and leave the pasta for about 10 minutes or until it is done.',
      'Mash the garlic a little with the smooth side of the knife.',
      'In a frying pan, melt the butter and fry the bacon and garlic for about 5 minutes, until the turkey pieces are done.',
      'Take the garlic out of the pan and reduce the heat under the skillet.',
      'When the pasta is done, take it out with the pasta spoon, drain it from its water, and then put it in the skillet over the bacon.',
      'Mix parmesan cheese with the scrambled eggs.',
      'Turn off the heat under the pan.',
      'Pour the egg mixture over the pasta.',
      'Mix the pasta together until blended.',
      'Season with salt and pepper to taste.',
      'Serve the pasta immediately, with more cheese and black pepper spread over the top.',
    ],
    "steps-m4": [
      'In a large frying pan over medium heat, add 2 tablespoons of mash butter.',
      'Put the shrimp, salt and pepper in the butter and stir constantly until soft.',
      'Put the garlic in the pan on the shrimp for 1 minute, then put the chicken soup and the lemon juice and let the mixture boil for 2 minutes.',
      'Put the rest of the amount of butter and stir until it melts.',
      'Stir the butter in the shrimp until all the ingredients are mixed.',
      'Put the shrimp in a serving dish, then garnish with parsley and serve.',
    ],
    "steps-m5": [
      'To prepare the marinade: Mix the marinade ingredients together, and keep them aside, until the salad is prepared. It is poured upon serving.',
      'Wash the lettuce, chop coarsely, and add to the bottom of a serving dish.',
      'After peeling the potatoes, boil them in a saucepan of water with salt added, until soft. Then, it is cut into medium-sized pieces, and they are added to a serving dish.',
      'Add tuna to the plate, along with tomato slices, onion rings, olives and capsicum.',
      'Cut the boiled eggs into quarters, and add to the plate, which is garnished with finely chopped parsley (optional).'
    ],
    "steps-m6": [
      'Mix cocoa, sugar, starch and salt in a bowl.',
      'Stir the milk and stir until the ingredients are homogeneous and dissolved.',
      'Heat the mixture in a saucepan over a stove until it begins to boil and the mixture becomes thick.',
      'Add vanilla and stir.',
      'Pour the mixture into small plates, put it in the refrigerator for at least 3 hours and serve cold.',
    ],
    "steps-m7": [
      'In a large bowl, sift together the flour, baking powder, salt and sugar.',
      'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      'Heat a lightly oiled griddle or frying pan over medium high heat.',
      'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
    ],
    "steps-m8": [
      'Slice and fry the chicken breast',
      'Process onion, garlic and ginger into paste and sauté everything',
      'Add spices and stir fry',
      'Add chicken breast + 250ml of water and cook everything for 10 minutes',
      'Add coconut milk',
      'Serve with rice'
    ],
    "steps-m9": [
      'Cut the chicken into cubes',
      'Grease a non-stick frying pan with a little oil and heat it over medium-high heat.',
      'Cook the chicken for 6 minutes, or until it turns golden and the color disappears.',
      'Mix honey, soy sauce, water, cornstarch flour, ginger and paprika together.',
      'Whisk the mixture until the cornmeal is gone.',
      'Put the mixture in the pan with the chicken.',
      'Cook chicken and mixture together until thickened.',
      'You can add some water if you notice that the mixture is too thick.',
      'Sprinkle sesame on the food.',
      'Cover for 10 minutes on low heat, to mix with the chicken and absorb the flavor.',
    ],
    "steps-m10": [
      'Wash, peel and cut the asparagus',
      'Cook in salted water',
      'Salt and pepper the asparagus',
      'Roast the pine nuts',
      'Halve the tomatoes',
      'Mix with asparagus, salad and dressing',
      'Serve with Baguette'
    ],
    "steps-m11": [
      'Wash the rice well, then boil it in water.',
      'When the rice is cooked, leave it for 15 minutes.',
      'Mix the sugar, salt and rice vinegar in a skillet over low heat, until you are sure that the salt and sugar are completely dissolved, to get the sushi mixture.',
      'In a large bowl, add the sushi mixture to the rice and let it cool.',
    ],
    "steps-m12": [
      'Cook the rice according to the instructions on the package. Just replace half of the water with coconut milk and half the sugar.',
      'There should be no liquids in the rice after it is cooked.',
      'In a deep saucepan, put the rest of the coconut milk and put it on a medium heat with the rest of the sugar until it boils.',
      'Bring the mixture to a boil, stirring constantly, until it becomes a slightly thick sauce.',
    ],
  };

  changeLan(bool lan) async {
    isEn = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn", isEn);
  }

  getLan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn = prefs.getBool("isEn") ?? true;
    notifyListeners();
  }

  Object getTexts(String txt) {
    if (isEn == true) return textsEn[txt];
    return textsAr[txt];
  }
}
