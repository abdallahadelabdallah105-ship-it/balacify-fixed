# Balacify 🍎

## تطبيق ذكي لتتبع السعرات الحرارية مدعوم بالذكاء الاصطناعي

### المميزات الرئيسية:
- 🔥 تتبع السعرات الحرارية بالذكاء الاصطناعي
- 📱 واجهة مستخدم عصرية وسهلة الاستخدام
- 🎯 تحليل التغذية الذكي
- 📊 تقارير مفصلة عن التقدم
- 🌙 وضع داكن وفاتح

### المتطلبات:
- Flutter 3.24.0 أو أحدث
- Dart SDK 3.6.0 أو أحدث

### التثبيت والإعداد:

#### 1. استنساخ المشروع
```bash
git clone https://github.com/abdallahadelabdallah105-ship-it/balacify-fixed.git
cd balacify-fixed
```

#### 2. تثبيت المكتبات
```bash
flutter pub get
```

#### 3. إعداد مفاتيح API

**خطوة مهمة جداً**: قم بإعداد مفاتيح API في ملف `.env`:

```env
# اختر نوع API التغذية المناسب لك:

# خيار 1: Nutritionix API (مجاني حتى 1000 طلب/شهر)
NUTRITION_API_KEY=your_nutritionix_api_key_here

# خيار 2: Edamam API (مجاني حتى 5000 طلب/شهر) 
# NUTRITION_API_KEY=your_edamam_api_key_here

# للذكاء الاصطناعي:
GOOGLE_GENERATIVE_AI_KEY=your_google_ai_api_key_here
```

#### 4. الحصول على مفاتيح API:

##### أ) Nutritionix API (الأسهل والأسرع):
1. اذهب إلى [Nutritionix Developer](https://developer.nutritionix.com/)
2. قم بإنشاء حساب مجاني
3. احصل على API Key و Application ID
4. ضع المفتاح في ملف `.env`

##### ب) Google Generative AI:
1. اذهب إلى [Google AI Studio](https://makersuite.google.com/)
2. قم بإنشاء حساب
3. احصل على API Key
4. ضع المفتاح في ملف `.env`

#### 5. تشغيل التطبيق
```bash
# تنظيف المشروع
flutter clean

# تحديث المكتبات
flutter pub get

# تشغيل التطبيق
flutter run
```

### الحالة الحالية للمشروع:

✅ **جاهز للتشغيل**:
- التطبيق يعمل بشكل طبيعي
- واجهة المستخدم محسّنة
- Firebase معطل مؤقتاً (لا يسبب مشاكل)
- معالجة الأخطاء محسّنة

⏸️ **معطل مؤقتاً**:
- Firebase Authentication
- Firebase Analytics
- Cloud Functions

### هيكل المشروع:
```
balacify-fixed/
├── lib/
│   ├── main.dart          # نقطة دخول التطبيق
│   └── app.dart           # إعدادات التطبيق الرئيسية
├── .env                   # مفاتيح API (تحتاج لإعدادها)
├── .gitignore            # ملفات محمية من Git
└── pubspec.yaml          # مكتبات Flutter
```

### استكشاف الأخطاء:

#### مشكلة: التطبيق لا يعمل
```bash
# تأكد من وجود Flutter
flutter doctor

# تنظيف وإعادة تثبيت
flutter clean
flutter pub get
flutter run
```

#### مشكلة: API لا يعمل
1. تأكد من صحة مفتاح API في ملف `.env`
2. تأكد من عدم وجود مسافات في المفتاح
3. تأكد من صحة اسم المتغير

#### مشكلة: Firebase errors
Firebase معطل مؤقتاً، لذلك أي أخطاء متعلقة به ستختفي.

### المساهمة في المشروع:
1. Fork المشروع
2. إنشاء branch جديد
3. قم بالتعديلات
4. Submit Pull Request

### الدعم:
إذا واجهت أي مشاكل، قم بإنشاء Issue في GitHub.

### الترخيص:
MIT License - يمكنك استخدام المشروع بحرية.

---

**نصيحة**: ابدأ بـ Nutritionix API لأنه الأسهل في الإعداد والأسرع في الاستجابة!

🚀 **المشروع جاهز للتطوير والاستخدام!**