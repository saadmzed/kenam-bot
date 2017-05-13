local function run (msg , matches)
if matches[1]:lower() == "help" or matches[1] == 'مساعدة' and is_mod(msg) then
if not lang then
text = [[

💠 kenam-bot Help 💠
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
🔶 !mod help
⚙️》اوامر الادمن
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
🔷 !lock1
⚙️》قفل1
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
🔶 !lock2
⚙️》قفل2
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
🔷 !sudo help
⚙️》اوامر المطور
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
‼ ملاحضه ‼ 
الاوامر وقوائم المساعدة تعمل باللغه الانكلش والعربية👇

 مساعدة-1-2   👉👈  lock help!   
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
🌐 @saad7m  🌐 ;) مطور البوت
🌐 @kenamch 🌐 ;)  قناة البوت
]]

elseif lang then

text = [[

💠 kenam-bot Help 💠
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
🔶 !mod help
⚙️》اوامر الادمن
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
🔷 !lock1
⚙️》قفل1
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
🔶 !lock2
⚙️》قفل2
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
🔷 !sudo help
⚙️》اوامر المطور
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
‼ ملاحضه ‼ 
الاوامر وقوائم المساعدة تعمل باللغه الانكلش والعربية👇

 مساعدة-1-2   👉👈  lock help!   
︻︻︻︻︻︻︻︻︻︻︻︻︻︻
🌐 @saad7m  🌐 ;) مطور البوت
🌐 @kenamch 🌐 ;)  قناة البوت
]]
end
return text
end
-----------------------------------------
if matches[1]:lower() == "lock1" or matches[1] == 'قفل1' and is_mod(msg) then
if not lang then
lock = [[
🔐قفل1🔛lock1!🔐
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل روابط
🔸فتح روابط
🔹lock link
🔸unlock link
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل تاك
🔸فتح تاك
🔹lock tag
🔸unlock tag
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل تعديل
🔸فتح تعديل
🔹lock edit
🔸unlock edit
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔸قفل فواحش
🔸فتح فواحش
🔹 lock fosh
🔸 unlock fosh
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل العربيه
🔸فتح العربيه
🔹lock arabic
🔸unlock arabic
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل ويب
🔸قتح ويب
🔹lock webpage
🔸unlock webpage
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل بوتات
🔸فتح بوتات
🔹lock bots
🔸unlock bots
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل كلايش
🔸 فتح كلايش
🔹lock spam
🔸unlock spam
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل تكرار
🔸فتح تكرار
🔹lock flood
🔸unlock flood
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄ 
🔹قفل  ماركد
🔸فتح ماركد
🔹lock markdown
🔸unlock markdown
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل منشن
🔸فتح منشن
🔹lock mention 
🔸unlock mention
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🌐 @saad7m  🌐 ;) مطور البوت
🌐 @kenamch 🌐 ;)  قناة البوت
]]

elseif lang then

lock = [[
🔐قفل1🔛lock1!🔐
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل روابط
🔸فتح روابط
🔹lock link
🔸unlock link
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل تاك
🔸فتح تاك
🔹lock tag
🔸unlock tag
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل تعديل
🔸فتح تعديل
🔹lock edit
🔸unlock edit
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔸قفل فواحش
🔸فتح فواحش
🔹 lock fosh
🔸 unlock fosh
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل العربيه
🔸فتح العربيه
🔹lock arabic
🔸unlock arabic
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل ويب
🔸قتح ويب
🔹lock webpage
🔸unlock webpage
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل بوتات
🔸فتح بوتات
🔹lock bots
🔸unlock bots
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل كلايش
🔸 فتح كلايش
🔹lock spam
🔸unlock spam
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل تكرار
🔸فتح تكرار
🔹lock flood
🔸unlock flood
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄ 
🔹قفل  ماركد
🔸فتح ماركد
🔹lock markdown
🔸unlock markdown
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل منشن
🔸فتح منشن
🔹lock mention 
🔸unlock mention
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🌐 @saad7m  🌐 ;) مطور البوت
🌐 @kenamch 🌐 ;)  قناة البوت
]]
end
return lock
end
-----------------------------------------
if matches[1]:lower() == "lock2" or matches[1] == 'قفل2' and is_mod(msg) then
if not lang then
lock2 = [[
🔐قفل2🔛lock2!🔐
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل متحركه
🔸 فتح متحركه
🔹 !lock gif
🔸 !unlock gif
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل صور
🔸 فتح صور
 🔹 !lock photo
🔸  !unlock photo
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل فايل
🔸 فتح فايل
🔹 !lock document 
🔸 !unlock document
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل ملسق
🔸 فتح ملسق
🔹  !lock sticker
🔸 !unlock sticker
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل فديو
🔸 فتح فديو
🔹 !lock video
🔸 !unlock video
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل نص
🔸 فتح نص
🔹 !lock text
🔸 !unlock text
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل توجيه
🔸 فتح توجيه
🔹  !lock forward
🔸  !unlock forward
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل صوت
🔸 فتح صوت
🔹  !lock voice
🔸 !unlock voice
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل جهات
🔸 فتح جهات
🔹  !lock contact
🔸 !unlock contact
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل الكل
🔸 فتح الكل
🔹 !lock all
🔸 !unlock all
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل  شفافه
🔸فتح شفافه
🔹 !lock inline
🔸 !unlock inline
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🌐 @saad7m  🌐 ;) مطور البوت
🌐 @kenamch 🌐 ;)  قناة البوت
]]

elseif lang then

lock2 = [[
🔐قفل2🔛lock2!🔐
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل متحركه
🔸 فتح متحركه
🔹 !lock gif
🔸 !unlock gif
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل صور
🔸 فتح صور
 🔹 !lock photo
🔸  !unlock photo
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل فايل
🔸 فتح فايل
🔹 !lock document 
🔸 !unlock document
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل ملسق
🔸 فتح ملسق
🔹  !lock sticker
🔸 !unlock sticker
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل فديو
🔸 فتح فديو
🔹 !lock video
🔸 !unlock video
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل نص
🔸 فتح نص
🔹 !lock text
🔸 !unlock text
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل توجيه
🔸 فتح توجيه
🔹  !lock forward
🔸  !unlock forward
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل صوت
🔸 فتح صوت
🔹  !lock voice
🔸 !unlock voice
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل جهات
🔸 فتح جهات
🔹  !lock contact
🔸 !unlock contact
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹 قفل الكل
🔸 فتح الكل
🔹 !lock all
🔸 !unlock all
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🔹قفل  شفافه
🔸فتح شفافه
🔹 !lock inline
🔸 !unlock inline
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🌐 @saad7m  🌐 ;) مطور البوت
🌐 @kenamch 🌐 ;)  قناة البوت
]]
end
return lock2
end
-----------------------------------------
if matches[1]:lower() == "mod help" or matches[1] == "اوامر الادمن" and is_mod(msg) then
if not lang then
helpfun = [[
🔶اوامر الادمن🔛mod help!🔶
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !setowner [username|id|reply] 
🔷 مشرف【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !remowner [username|id|reply] 
🔷 حذف مشرف【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !promote [username|id|reply] 
🔷 مدير【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !demote [username|id|reply] 
🔷 حذف مدير【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !setflood [1-50]
🔷 ضع تكرار【50-1】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !silent [username|id|reply] 
🔷 كتم【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !unsilent [username|id|reply] 
🔷 الغاء كتم【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !kick [username|id|reply] 
🔷 طرد【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !ban [username|id|reply] 
🔷 حضر【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !unban [username|id|reply] 
🔷 الغاء حضر【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !res [username]
🔷 ايد 【مع المعرف】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !id [reply]
🔶 ایدي 【بالرد】 
 ﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !whois [id]
🔷 اضهار 【ايدي】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !set[rules | name | photo | link | about ]
🔶 ضع 【قوانین | اسم - صوره| رابط | وصف 】
 ﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !clean [bans | mods | bots | rules | about | silentlist | filterlist | welcome]   
🔷 حذف 【 المحضورين| مدراء | قوانین | بوتات | المكتومين |  الممنوعه | ترحيب 】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !filter [الكلمه]
🔶 منع‌【لمنع كلمه】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !unfilter [الكلمه]
🔷 سماح 【للسماح بالكلمه】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !pin [reply]
🔶 تثبيت 【بالرد لثبيت رساله】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !unpin [reply]
🔷 الغاء تثبيت【بالرد لالغاء تثبيت رساله】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !welcome enable/disable
🔶 الترحيب  [فعال - غیر فعال]
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !settings
🔷  اعدادات
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !silentlist
🔷 المكتومين
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !filterlist
🔶 الممنوعه
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !banlist
🔷 المحضورين
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !ownerlist
🔶 المشرفين
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !modlist 
🔷 المدراء
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !rules
🔶 قوانین
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !about
🔷  الوصف
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !id
🔶 ایدي
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !gpinfo
🔷  معلومات
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !link
🔶  رابط
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !setwelcome [text]
🔷 ضع ترحيب
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
‼️ ملاحضه ‼️
الاوامر وقوائم المساعدة تعمل باللغه الانكلش والعربيه 👇

 اعدادات    👉👈   settings!                
 ﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🌐 @saad7m  🌐 ;) مطور البوت
🌐 @kenamch 🌐 ;)  قناة البوت
]]
tdcli.sendMessage(msg.chat_id_, 0, 1, helpfun, 1, 'md')
else

helpfun = [[
🔶اوامر الادمن🔛mod help!🔶
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !setowner [username|id|reply] 
🔷 مشرف【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !remowner [username|id|reply] 
🔷 حذف مشرف【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !promote [username|id|reply] 
🔷 مدير【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !demote [username|id|reply] 
🔷 حذف مدير【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !setflood [1-50]
🔷 ضع تكرار【50-1】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !silent [username|id|reply] 
🔷 كتم【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !unsilent [username|id|reply] 
🔷 الغاء كتم【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !kick [username|id|reply] 
🔷 طرد【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !ban [username|id|reply] 
🔷 حضر【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !unban [username|id|reply] 
🔷 الغاء حضر【بالمعرف| بالايدي| بالرد】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !res [username]
🔷 ايد 【مع المعرف】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !id [reply]
🔶 ایدي 【بالرد】 
 ﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !whois [id]
🔷 اضهار 【ايدي】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !set[rules | name | photo | link | about ]
🔶 ضع 【قوانین | اسم - صوره| رابط | وصف 】
 ﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !clean [bans | mods | bots | rules | about | silentlist | filterlist | welcome]   
🔷 حذف 【 المحضورين| مدراء | قوانین | بوتات | المكتومين |  الممنوعه | ترحيب 】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !filter [الكلمه]
🔶 منع‌【لمنع كلمه】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !unfilter [الكلمه]
🔷 سماح 【للسماح بالكلمه】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !pin [reply]
🔶 تثبيت 【بالرد لثبيت رساله】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !unpin [reply]
🔷 الغاء تثبيت【بالرد لالغاء تثبيت رساله】
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !welcome enable/disable
🔶 الترحيب  [فعال - غیر فعال]
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !settings
🔷  اعدادات
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !silentlist
🔷 المكتومين
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !filterlist
🔶 الممنوعه
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !banlist
🔷 المحضورين
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !ownerlist
🔶 المشرفين
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !modlist 
🔷 المدراء
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !rules
🔶 قوانین
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !about
🔷  الوصف
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !id
🔶 ایدي
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !gpinfo
🔷  معلومات
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !link
🔶  رابط
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
✩》 !setwelcome [text]
🔷 ضع ترحيب
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
‼️ ملاحضه ‼️
الاوامر وقوائم المساعدة تعمل باللغه الانكلش والعربيه 👇

 اعدادات    👉👈   settings!                
 ﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🌐 @saad7m  🌐 ;) مطور البوت
🌐 @kenamch 🌐 ;)  قناة البوت
]]
tdcli.sendMessage(msg.chat_id_, 0, 1, helpfun, 1, 'md')
end
end
-----------------------------------------
if matches[1] == "sudo help" or  matches[1] == "اوامر المطور" and is_mod(msg) then
if not lang then
text = [[

🔰 اوامر المطور - @saad7m 🔰
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !visudo [username|id|reply]
✰》رفع مطور 
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
 ⚜️ !desudo [username|id|reply]
✰》 حذف مطور
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !sudolist 
✰》 المطورين
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !adminprom [username|id|reply]
✰》 مساعد مطور
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !admindem [username|id|reply]
✰》 حذف مساعد
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !adminlist 
✰》 المساعدين
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !leave 
✰》 خروج البوت
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !autoleave [disable/enable]
 ✰》 تفعيل - تعطيل خروج البوت
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !creategroup [text]
✰》 صنع مجموعه
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !createsuper [text]
✰》 صنع مجموعه خارقه
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !tosuper 
✰》 تحويل سوبر
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !chats
✰》 مجموعات البوت
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !join [id]
✰》 دخولك لمجموعه 
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !rem [id]
✰》 حذف مجموعه عبر الايدي
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !import [link]
✰》 اضافة البوت بالرابط
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !setbotname [text]
✰》 تغییر اسم البوت
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !setbotusername [text]
✰》 تغییر معرف البوت
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !delbotusername 
✰》 حذف معرف البوت
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !markread [off/on]
✰》 القراءه
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !broadcast [text]
✰》 رساله عامه
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !bc [text] [gpid]
✰》 ارسال رساله لمجموعه
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !sendfile [cd] [file]
✰》 ارسال ملف كود
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !sendplug [plug]
✰》 ارسال ملف بالرد
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !save [plugin name] [reply]
✰》 حفظ ملف معين
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !savefile [address/filename] [reply]
✰》 حفظ كود معين 
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !clear cache
✰》 حذف مخبآ او الرقم .telegram-cli/data
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !expire
✰》 اضهار وقت انتهاء التفعيل
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !setexpire 30-1
✰》 تحديد فترة التفعيل
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !charge [GroupID] [Number Of Days]
✰》 شحن مدة عمل البوت بالايدي
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !charge [Number Of Days]
✰》 شحن مدة عمل البوت 
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !jointo [GroupID]
✰》 اضافة البوت عبر الايدي
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
⚜️ !leave [GroupID]
✰》 اخراج البوت عبر الايدي
﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄
🌐 @saad7m  🌐 ;) مطور البوت
🌐 @kenamch 🌐 ;)  قناة البوت
]]
tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'md')
else

text = [[
اوامر المطور🔛sudo help!🔶

!visudo [username|id|reply]
Add Sudo

!desudo [username|id|reply]
Demote Sudo

!sudolist 
Sudo(s) list

!adminprom [username|id|reply]
Add admin for bot

!admindem [username|id|reply]
Demote bot admin

!adminlist 
Admin(s) list

!leave 
Leave current group

!autoleave [disable/enable]
Automatically leaves group

!creategroup [text]
Create normal group

!createsuper [text]
Create supergroup

!tosuper 
Convert to supergroup

!join [id]
Adds you to the group

!rem [id]
Remove a group from Database

!import [link]
Bot joins via link

!setbotname [text]
Change bot's name

!setbotusername [text]
Change bot's username

!delbotusername 
Delete bot's username

!markread [off/on]
Second mark

!broadcast [text]
Send message to all added groups

!bc [text] [gpid]
Send message to a specific group

!del [Reply]
Remove message Person you are

!clear cache
Clear All Cache Of .telegram-cli/data

!expire
Stated Expiration Date

!setexpire [Number Of Days]
Set Expire Time For Group

!leave [GroupID]
Leave Bot From Specific Group
🌐 @saad7m  🌐 ;) مطور البوت
🌐 @kenamch 🌐 ;)  قناة البوت
]]
tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'md')
end
end
end


return {
patterns ={
"^([Hh]elp)$",
"^(lock1)$",
"^(lock2)$",
"^(mod help)$",
"^(sudo help)$",
"^(مساعدة)$",
"^(قفل1)$",
"^(قفل2)$",
"^(اوامر الادمن)$",
"^(اوامر المطور)$"

}, 
run =run
}
