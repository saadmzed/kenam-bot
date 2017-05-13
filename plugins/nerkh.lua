 local function run(msg, matches) 
if matches [1] =='setnerkh' then 
if not is_admin(msg) then 
return 'للمطور فقط' 
end 
local nerkh = matches[2] 
redis:set('bot:nerkh',nerkh) 
return 'تم ضبط سعر البوت' 
end 
if matches[1] == 'nerkh' or 'السعر' then 
if not is_mod(msg) then 
return 
end 
    local hash = ('bot:nerkh') 
    local nerkh = redis:get(hash) 
    if not nerkh then 
    return 'ثبت السعر اولا' 
    else 
     tdcli.sendMessage(msg.chat_id_, 0, 1, nerkh, 1, 'html') 
    end 
    end 
if matches[1]=="delnerkh" then 
if not is_admin(msg) then 
return 'للمطور فقط' 
end 
    local hash = ('bot:nerkh') 
    redis:del(hash) 
return 'تم اخلاء القائمه' 
end 
end 
return { 
patterns ={ 
"^[!#/](setnerkh) (.*)$", 
"^[!#/](nerkh)$",
"^💳$",
"^سعر البوت",
"^قيمة البوت$",
"^السعر$", 
"^[!#/](delnerkh)$", 
}, 
run = run 
}
