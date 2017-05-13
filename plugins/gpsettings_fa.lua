local function modadd(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    if not is_admin(msg) then
   if not lang then
        return '_You are not bot admin_'
else
     return 'انت لست مطور'
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.chat_id_)] then
if not lang then
   return '_♻️Group is already added♻️_'
else
return '♻️المجموعة مضافة بالفعل♻️'
  end
end
        -- create data array in moderation.json
      data[tostring(msg.chat_id_)] = {
              owners = {},
      mods ={},
      banned ={},
      is_silent_users ={},
      filterlist ={},
      settings = {
          lock_link = 'yes',
          lock_tag = 'yes',
		  lock_fosh = 'yes',
          lock_spam = 'no',
          lock_webpage = 'yes',
		  lock_arabic = 'no',
          lock_markdown = 'yes',
          flood = 'yes',
          lock_bots = 'yes',
          lock_forward = 'no',
          lock_audio = 'no',
                  lock_video = 'no',
                  lock_contact = 'no',
                  lock_text = 'no',
                  lock_photos = 'no',
                  lock_gif = 'no',
                  lock_location = 'no',
                  lock_document = 'no',
                  lock_sticker = 'no',
                  lock_voice = 'no',
                  lock_all = 'no'
          }
      }
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.chat_id_)] = msg.chat_id_
      save_data(_config.moderation.data, data)
    if not lang then
  return '*✔️Group has been added✔️*'
else
  return '✔️تم اضافة المجموعة✔️'
end
end

local function modrem(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
     if not lang then
        return '_You are not bot admin_'
   else
        return 'انت لست مطور'
    end
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.chat_id_
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return '_Group is not added_'
else
    return 'المجموعه ليست مضافه'
   end
  end

  data[tostring(msg.chat_id_)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.chat_id_)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
  return '*Group has been removed*'
 else
  return 'تم ازالة المجموعه'
end
end

local function filter_word(msg, word)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
  if not data[tostring(msg.chat_id_)]['filterlist'] then
    data[tostring(msg.chat_id_)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
if data[tostring(msg.chat_id_)]['filterlist'][(word)] then
   if not lang then
         return "_Word_ *"..word.."* _is already filtered_"
            else
         return "_کلمه_ *"..word.."* _بالفعل تمت اضافتها للمنع_"
    end
end
   data[tostring(msg.chat_id_)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
         return "_Word_ *"..word.."* _added to filtered words list_"
            else
         return "_کلمه_ *"..word.."* _تمت اضافتها لقائمة المنع_"
    end
end

local function unfilter_word(msg, word)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.chat_id_)]['filterlist'] then
    data[tostring(msg.chat_id_)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if data[tostring(msg.chat_id_)]['filterlist'][word] then
      data[tostring(msg.chat_id_)]['filterlist'][(word)] = nil
       save_data(_config.moderation.data, data)
       if not lang then
         return "_Word_ *"..word.."* _removed from filtered words list_"
       elseif lang then
         return "_کلمه_ *"..word.."* _تمت ازالتها من قائمة المنع_"
     end
      else
       if not lang then
         return "_Word_ *"..word.."* _is not filtered_"
       elseif lang then
         return "_کلمه_ *"..word.."* _ليست ممنوعه_"
      end
   end
end

local function modlist(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return "_Group is not added_"
 else
    return "المجموعه ليست مضافه"
  end
 end
  -- determine if table is empty
  if next(data[tostring(msg.chat_id_)]['mods']) == nil then --fix way
  if not lang then
    return "_No_ *moderator* _in this group_"
else
   return "لا يوجد مدراء في المجموعه"
  end
end
if not lang then
   message = '*List of moderators :*\n'
else
   message = '*قائمة المدراء:*\n'
end
  for k,v in pairs(data[tostring(msg.chat_id_)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function ownerlist(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
if not lang then
    return "_Group is not added_"
else
return "المجموعه ليست مضافه"
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.chat_id_)]['owners']) == nil then --fix way
 if not lang then
    return "_No_ *owner* _in this group_"
else
    return "المجموعه خاليه من المشرفين"
  end
end
if not lang then
   message = '*List of moderators :*\n'
else
   message = '*قائمة المشرفين:*\n'
end
  for k,v in pairs(data[tostring(msg.chat_id_)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
  if not administration[tostring(data.chat_id_)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "_Group is not added_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_المجموعه ليست مضافه_", 0, "md")
     end
  end
if cmd == "setowner" then
local function owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already a_ *group owner*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_الاستاذ_ "..user_name.." *"..data.id_.."* *بالفعل مشرف*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is now the_ *group owner*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *الان مشرف المجموعه*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "promote" then
local function promote_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already a_ *moderator*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_الاستاذ_ "..user_name.." *"..data.id_.."* *مدير بالفعل*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *promoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *تم رفعه كمدير للمجموعه*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
     if cmd == "remowner" then
local function rem_owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not a_ *group owner*", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* *لم يعد مشرف للمجموعه*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is no longer a_ *group owner*", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *لم يعد مشرف للمجموعه*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "demote" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not a_ *moderator*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *انه الان ليس مديرا*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *demoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *لم يعد مديرا للمجموعه*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "id" then
local function id_cb(arg, data)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, id_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "_العضو غير موجود_", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "*User Not Found*", 0, "md")
      end
   end
end

local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "_Group is not added_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_المجموعه ليست مضافه_", 0, "md")
     end
  end
if not arg.username then return false end
   if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already a_ *group owner*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_الاستاذ_ "..user_name.." *"..data.id_.."* *بالفعل مشرف المجموعه*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is now the_ *group owner*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_الاستاذ_ "..user_name.." *"..data.id_.."* *تم اضافته كمشرف جديد للمجموعه*", 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already a_ *moderator*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_الاستاذ_ "..user_name.." *"..data.id_.."* *بالفعل مدير للمجموعه*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *promoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_الاستاذ_ "..user_name.." *"..data.id_.."* *تم رفعه مديرا للمجموعه*", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not a_ *group owner*", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *لم يعد مشرفا للمجموعه*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is no longer a_ *group owner*", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *لم يعد مشرفا للمجموعه*", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not a_ *moderator*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *ليس مديرا*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *demoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *تم ازالته من المدراء*", 0, "md")
   end
end
   if cmd == "id" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
    if cmd == "res" then
    if not lang then
     text = "Result for [ ".. check_markdown(data.type_.user_.username_) .." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
  else
     text = "نتيجه لل [ ".. check_markdown(data.type_.user_.username_) .." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
      end
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو غير موجود_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*User Not Found*", 0, "md")
      end
   end
end

local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "_Group is not added_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_المجموعه ليست مضافه_", 0, "md")
     end
  end
if not tonumber(arg.user_id) then return false end
   if data.id_ then
if data.first_name_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if cmd == "setowner" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already a_ *group owner*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_الاستاذ_ "..user_name.." *"..data.id_.."* *بالفعل مشرف للمجموعه*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is now the_ *group owner*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_الاستاذ_ "..user_name.." *"..data.id_.."* *تم رفعه مشرفا اضافيا للمجموعه*", 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already a_ *moderator*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_الاستاذ_ "..user_name.." *"..data.id_.."* *بالفعل مديرا للمجموعه*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *promoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_الاستاذ_ "..user_name.." *"..data.id_.."* *تم رفعه مديرا للمجموعه*", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not a_ *group owner*", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *ليش مشرفا للمجموعه*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is no longer a_ *group owner*", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *ليس مشرفا بالمجموعه*", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not a_ *moderator*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *ليس مديرا للمجموعه*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *demoted*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *تم حذفه من المدراء*", 0, "md")
   end
end
    if cmd == "whois" then
if data.username_ then
username = '@'..check_markdown(data.username_)
else
if not lang then
username = 'not found'
 else
username = 'غير موجود'
  end
end
     if not lang then
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'Info for [ '..data.id_..' ] :\nUserName : '..username..'\nName : '..data.first_name_, 1)
   else
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'معلومات الايدي [ '..data.id_..' ] :\nالمعرف : '..username..'\nالاسم : '..data.first_name_, 1)
      end
   end
 else
    if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User not founded_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو غير موجود_", 0, "md")
    end
  end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو غير موجود_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*User Not Found*", 0, "md")
      end
   end
end


---------------Lock Link-------------------
local function lock_link(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
if not lang then
 return "🔐*Link* _Posting Is Already Locked_🔐"
elseif lang then
 return "🔐الروابط مقفوله مسبقا🔐"
end
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*Link* _Posting Has Been Locked_🔐"
else
 return "🔐تم قفل ارسال الروابط🔐"
end
end
end

local function unlock_link(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "انت لست ادمن"
end
end 

local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
if not lang then
return "🔓*Link* _Posting Is Not Locked_🔓" 
elseif lang then
return "🔓الروابط ليست مقفله🔓"
end
else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓*Link* _Posting Has Been Unlocked_🔓" 
else
return "🔓تم فتح ارسال الروابط🔓"
end
end
end



---------------Lock fosh-------------------
local function lock_fosh(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end
end

local lock_fosh = data[tostring(target)]["settings"]["lock_fosh"] 
if lock_fosh == "yes" then
if not lang then
 return "🔐*Fosh* _Posting Is Already Locked_🔐"
elseif lang then
 return "🔐الفواحش مقفوله مسبقا🔐"
end
else
data[tostring(target)]["settings"]["lock_fosh"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*Fosh* _ Has Been Locked_🔐"
else
 return "🔐تم قفل الفواحش🔐"
end
end
end

local function unlock_fosh(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "انت لست ادمن"
end
end 

local lock_fosh = data[tostring(target)]["settings"]["lock_fosh"]
 if lock_fosh == "no" then
if not lang then
return "🔓*Fosh* _Is Not Locked_🔓" 
elseif lang then
return "🔓الفواحش مفتوحه مسبقا🔓"
end
else 
data[tostring(target)]["settings"]["lock_fosh"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓*Fosh* _Has Been Unlocked_🔓" 
else
return "🔓تم فتح الفواحش🔓"
end
end
end

---------------Lock Tag-------------------
local function lock_tag(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == "yes" then
if not lang then
 return "🔐*Tag* _Posting Is Already Locked_🔐"
elseif lang then
 return "🔐التاك المعرف بالفعل مقفل🔐"
end
else
 data[tostring(target)]["settings"]["lock_tag"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*Tag* _Posting Has Been Locked_🔐"
else
 return "🔐تم قفل التاك او المعرف🔐"
end
end
end

local function unlock_tag(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end 
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == "no" then
if not lang then
return "🔓*Tag* _Posting Is Not Locked_🔓" 
elseif lang then
return "🔓التاك او المعرف غير مقفل🔓"
end
else 
data[tostring(target)]["settings"]["lock_tag"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓*Tag* _Posting Has Been Unlocked_🔓" 
else
return "🔓تم فتح التاك او المعرف🔓"
end
end
end

---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
 local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end
end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
if not lang then
 return "🔐*Mention* _Posting Is Already Locked_🔐"
elseif lang then
 return "🔐ارسال المنشن بالفعل مقفل🔐"
end
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
if not lang then 
 return "🔐*Mention* _Posting Has Been Locked_🔐"
else 
 return "🔐تم قفل ارسال المنشن🔐"
end
end
end

local function unlock_mention(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "انت لست ادمن"
end
end 

local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
if not lang then
return "🔓*Mention* _Posting Is Not Locked_🔓" 
elseif lang then
return "🔓ارسال المنشن بالفعل مفتوح🔓"
end
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓*Mention* _Posting Has Been Unlocked_🔓" 
else
return "🔓تم فتح ارسال المنشن🔓"
end
end
end

---------------Lock Arabic--------------
local function lock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end
end

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == "yes" then
if not lang then
 return "🔐*Arabic/Persian* _Posting Is Already Locked_🔐"
elseif lang then
 return "🔐اللغه العربيه مقفوله مسبقا🔐"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*Arabic/Persian* _Posting Has Been Locked_🔐"
else
 return "🔐تم قفل اللغه العربيه🔐"
end
end
end

local function unlock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "انت لست ادمن"
end
end 

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == "no" then
if not lang then
return "🔓*Arabic/Persian* _Posting Is Not Locked_🔓" 
elseif lang then
return "🔓اللغه العربيه مفتوحه مسبقا🔓"
end
else 
data[tostring(target)]["settings"]["lock_arabic"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓*Arabic/Persian* _Posting Has Been Unlocked_🔓" 
else
return "🔓تم فتح اللغه العربيه🔓"
end
end
end

---------------Lock Edit-------------------
local function lock_edit(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end
end

local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then
if not lang then
 return "🔐*Editing* _Is Already Locked_🔐"
elseif lang then
 return "🔐التعديل بالفعل مقفل🔐"
end
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*Editing* _Has Been Locked_🔐"
else
 return "🔐تم قفل تعديل الرسائل🔐"
end
end
end

local function unlock_edit(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "انت لست ادمن"
end
end 

local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
if not lang then
return "🔓*Editing* _Is Not Locked_🔓" 
elseif lang then
return "🔓تعديل الرسائل ليس مقفلا🔓"
end
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓*Editing* _Has Been Unlocked_🔓" 
else
return "🔓تم فتح تعديل الرسائل🔓"
end
end
end

---------------Lock spam-------------------
local function lock_spam(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end
end

local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
if not lang then
 return "🔐*Spam* _Is Already Locked_🔐"
elseif lang then
 return "🔐الكلايش بالفعل مقفوله🔐"
end
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*Spam* _Has Been Locked_🔐"
else
 return "🔐تم قفل ارسال الكلايش🔐"
end
end
end

local function unlock_spam(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "انت لست ادمن"
end
end 

local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
if not lang then
return "🔓*Spam* _Posting Is Not Locked_🔓" 
elseif lang then
 return "🔓ارسال الكلايش غير مقفل🔓"
end
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" save_data(_config.moderation.data, data)
if not lang then 
return "🔓*Spam* _Posting Has Been Unlocked_🔓" 
else
 return "🔓تم فتح ارسال الكلايش🔓"
end
end
end

---------------Lock Flood-------------------
local function lock_flood(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end
end

local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then
if not lang then
 return "🔐*Flooding* _Is Already Locked_🔐"
elseif lang then
 return "🔐التكرار بالفعل مقفل🔐"
end
else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*Flooding* _Has Been Locked_🔐"
else
 return "🔐تم قفل التكرار🔐"
end
end
end

local function unlock_flood(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "انته لست ادمن"
end
end 

local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then
if not lang then
return "🔓*Flooding* _Is Not Locked_🔓" 
elseif lang then
return "🔓التكرار مفتوح مسبقا🔓"
end
else 
data[tostring(target)]["settings"]["flood"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓*Flooding* _Has Been Unlocked_🔓" 
else
return "🔓تم فتح التكرار🔓"
end
end
end

---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
if not lang then
 return "🔐*Bots* _Protection Is Already Enabled_🔐"
elseif lang then
 return "🔐اضافة البوتات بالفعل مقفله🔐"
end
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*Bots* _Protection Has Been Enabled_🔐"
else
 return "🔐تم قفل اضافة البوتات🔐"
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "انت لست ادمن"
end 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
if not lang then
return "🔓*Bots* _Protection Is Not Enabled_🔓" 
elseif lang then
return "🔓اضافة البوتات بالفعل مفتوحه🔓"
end
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓*Bots* _Protection Has Been Disabled_🔓" 
else
return "🔓تم فتح اضافة البوتات🔓"
end
end
end

---------------Lock Markdown-------------------
local function lock_markdown(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
if not lang then 
 return "🔐*Markdown* _Posting Is Already Locked_🔐"
elseif lang then
 return "🔐ارسال الماركدون بالفعل مقفل🔐"
end
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*Markdown* _Posting Has Been Locked_🔐"
else
 return "🔐تم قفل ارسال الماركدون🔐"
end
end
end

local function unlock_markdown(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "انت لست ادمن"
end 
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
if not lang then
return "🔓*Markdown* _Posting Is Not Locked_🔓"
elseif lang then
return "🔓ارسال الماركدون بالفعل مفتوح🔓"
end
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "🔓*Markdown* _Posting Has Been Unlocked_🔓"
else
return "🔓تم فتح ارسال الماركدون🔓"
end
end
end

---------------Lock Webpage-------------------
local function lock_webpage(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "انت لست ادمن"
end
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
if not lang then
 return "🔐*Webpage* _Is Already Locked_🔐"
elseif lang then
 return "🔐صفحات الويب بالفعل مقفله🔐"
end
else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*Webpage* _Has Been Locked_🔐"
else
 return "🔐تم قفل صفحات الويب🔐"
end
end
end

local function unlock_webpage(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end 
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
if not lang then
return "🔓*Webpage* _Is Not Locked_🔓" 
elseif lang then
return "🔓صفحات الويب غير مقفله🔓"
end
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "🔓*Webpage* _Has Been Unlocked_🔓" 
else
return "🔓تم فتح ارسال صفحات الويب🔓"
end
end
end

function group_settings(msg, target) 	
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 	return "_You're Not_ *Moderator*"
else
  return "✖️انت لست ادمن✖️"
end
end
local data = load_data(_config.moderation.data)
local target = msg.chat_id_ 
if data[tostring(target)] then 	
if data[tostring(target)]["settings"]["num_msg_max"] then 	
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
	print('custom'..NUM_MSG_MAX) 	
else 	
NUM_MSG_MAX = 5
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_edit"] then			
data[tostring(target)]["settings"]["lock_edit"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_link"] then			
data[tostring(target)]["settings"]["lock_link"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_fosh"] then			
data[tostring(target)]["settings"]["lock_fosh"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tag"] then			
data[tostring(target)]["settings"]["lock_tag"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_arabic"] then			
data[tostring(target)]["settings"]["lock_arabic"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_flood"] then			
data[tostring(target)]["settings"]["lock_flood"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_spam"] then			
data[tostring(target)]["settings"]["lock_spam"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_mention"] then			
data[tostring(target)]["settings"]["lock_mention"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_webpage"] then			
data[tostring(target)]["settings"]["lock_webpage"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["welcome"] then			
data[tostring(target)]["settings"]["welcome"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_markdown"] then			
data[tostring(target)]["settings"]["lock_markdown"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_bots"] then			
data[tostring(target)]["settings"]["lock_bots"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_gif"] then			
data[tostring(target)]["settings"]["lock_gif"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_text"] then			
data[tostring(target)]["settings"]["lock_text"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_inline"] then			
data[tostring(target)]["settings"]["lock_inline"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_game"] then			
data[tostring(target)]["settings"]["lock_game"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_photo"] then			
data[tostring(target)]["settings"]["lock_photo"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_video"] then			
data[tostring(target)]["settings"]["lock_video"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_audio"] then			
data[tostring(target)]["settings"]["lock_audio"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_voice"] then			
data[tostring(target)]["settings"]["lock_voice"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_sticker"] then			
data[tostring(target)]["settings"]["lock_sticker"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_contact"] then			
data[tostring(target)]["settings"]["lock_contact"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_forward"] then			
data[tostring(target)]["settings"]["lock_forward"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_location"] then			
data[tostring(target)]["settings"]["lock_location"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_document"] then			
data[tostring(target)]["settings"]["lock_document"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tgservice"] then			
data[tostring(target)]["settings"]["lock_tgservice"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_all"] then			
data[tostring(target)]["settings"]["lock_all"] = "no"		
end
end




local expiretime = redis:hget('expiretime', msg.chat_id_)
    local expire = ''
  if not expiretime then
  expire = expire..'Unlimited'
  else
   local now = tonumber(os.time())
   expire =  expire..math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
 end
	
	
	
if not lang then
local settings = data[tostring(target)]["settings"] 
 text = "⚙️*Group Settings*⚙️\n*__________________*\n● 》_Lock edit ➢_ *"..settings.lock_edit.."*\n● 》_Lock links ➢_ *"..settings.lock_link.."*\n● 》_Lock fosh ➢_ *"..settings.lock_fosh.."*\n● 》_Lock tags ➢_ *"..settings.lock_tag.."*\n● 》_Lock Persian ➢_ *"..settings.lock_arabic.."*\n● 》_Lock flood ➢_ *"..settings.flood.."*\n● 》_Lock spam ➢_ *"..settings.lock_spam.."*\n● 》_Lock mention ➢_ *"..settings.lock_mention.."*\n��� 》_Lock webpage ➢_ *"..settings.lock_webpage.."*\n● 》_welcome ➢_ *"..settings.welcome.."*\n● 》_Lock markdown ➢_ *"..settings.lock_markdown.."*\n● 》_Lock Bots ➢_ *"..settings.lock_bots.."*\n● 》_Lock gif ➢_ *"..settings.lock_gif.."*\n● 》_Lock text ➢_ *"..settings.lock_text.."*\n● 》_Lock inline ➢_ *"..settings.lock_inline.."*\n● 》_Lock game ➢_ *"..settings.lock_game.."*\n● 》_Lock photo ➢_ *"..settings.lock_photo.."*\n● 》_Lock video ➢_ *"..settings.lock_video.."*\n● 》_Lock audio ➢_ *"..settings.lock_audio.."*\n● 》_Lock voice ➢_ *"..settings.lock_voice.."*\n● 》_Lock sticker ➢_ *"..settings.lock_sticker.."*\n● 》_Lock contact ➢_ *"..settings.lock_contact.."*\n● 》_Lock forward ➢_ *"..settings.lock_forward.."*\n● 》_Lock location ➢_ *"..settings.lock_location.."*\n● 》_Lock document ➢_ *"..settings.lock_document.."*\n● 》_Lock TgService ➢_ *"..settings.lock_tgservice.."*\n● 》_Lock all : _ *"..settings.lock_all.."*\n*__________________*\n● 》_Set Flood ➢_ *"..NUM_MSG_MAX.."*\n● 》_Welcome ➢_ *"..settings.welcome.."*\n● 》_EXPIRE ➢_ *"..expire.."*\n*__________________*\n Enable✓ ➰ Disable✘ \n*__________________*\n support: @kenamch \n*__________________*\n*Language* : *EN*"
else
local settings = data[tostring(target)]["settings"] 
 text = "⚙️*اعدادات @saad7m المجموعه*⚙️\n*__________________*\n● 》_قفل التعديل ↫_ *"..settings.lock_edit.."*\n● 》_قفل الروابط ↫_ *"..settings.lock_link.."*\n● 》_قفل فواحش ↫_ *"..settings.lock_fosh.."*\n● 》_قفل التاك ↫_ *"..settings.lock_tag.."*\n● 》_قفل العربي ↫_ *"..settings.lock_arabic.."*\n● 》_قفل التكرار ↫_ *"..settings.flood.."*\n● 》_قفل الكلايش ↫_ *"..settings.lock_spam.."*\n● 》_قفل منشن ↫_ *"..settings.lock_mention.."*\n● 》_قفل الويب ↫_ *"..settings.lock_webpage.."*\n● 》_قفل ماركدون ↫_ *"..settings.lock_markdown.."*\n● 》_قفل بوتات ↫_ *"..settings.lock_bots.."*\n● 》_قفل المتحركه ↫_ *"..settings.lock_gif.."*\n● 》_قفل النص ↫_ *"..settings.lock_text.."*\n● 》_قفل الشفافه ↫_ *"..settings.lock_inline.."*\n● 》_قفل العاب ↫_ *"..settings.lock_game.."*\n● 》_قفل الصور ↫_ *"..settings.lock_photo.."*\n● 》_قفل الفديو ↫_ *"..settings.lock_video.."*\n● 》_قفل البصمه ↫_ *"..settings.lock_audio.."*\n● 》_قفل الصوت ↫_ *"..settings.lock_voice.."*\n● 》_قفل الملسقات ↫_ *"..settings.lock_sticker.."*\n● 》_قفل جهات ↫_ *"..settings.lock_contact.."*\n● 》_قفل توجيه ↫_ *"..settings.lock_forward.."*\n● 》_قفل مواقع ↫_ *"..settings.lock_location.."*\n● 》_قفل فايلات ↫_ *"..settings.lock_document.."*\n● 》_قفل خدمات تلگرام ↫_ *"..settings.lock_tgservice.."*\n● 》_قفل الكل ↫ _ *"..settings.lock_all.."*\n*__________________*\n● 》_عدد التكرار(الاقصى) ↫_ *"..NUM_MSG_MAX.."*\n● 》_ايام الاشتراك ↫_ *"..expire.."*\n الترحيب ↫_ *"..settings.welcome.."*\n● 》_مطور البوت :@saad7m *__________________*\n فعال✓ ➰ غیرفعال✘ \n*__________________*\n قناة البوت : @kenamch \n*__________________*\n*اللغه* : *عربي*"
end
if not lang then
text = string.gsub(text, "yes", "✓")
 text =  string.gsub(text, "no", "✘")
 else
 text = string.gsub(text, "yes", "✓")
 text =  string.gsub(text, "no", "✘")
 end
return text
end
--------locks---------
--------lock all------------------------
local function lock_all(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "_You're Not_ *Moderator*" 
else
return "✖️انت لست ادمن✖️"
end
end

local lock_all = data[tostring(target)]["settings"]["lock_all"] 
if lock_all == "yes" then 
if not lang then
return "����*lock All* _Is Already Enabled_🔐" 
elseif lang then
return "🔐قفل الكل مفعل مسبقا🔐"
end
else 
data[tostring(target)]["settings"]["lock_all"] = "yes"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔐*lock All* _Has Been Enabled_����" 
else
return "🔐تم قفل الكل🔐"
end
end
end

local function unlock_all(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "_You're Not_ *Moderator*" 
else
return "✖️انت لست ادمن✖️"
end
end

local lock_all = data[tostring(target)]["settings"]["lock_all"] 
if lock_all == "no" then 
if not lang then
return "🔓*lock All* _Is Already Disabled_🔓" 
elseif lang then
return "🔓قفل الكل معطل مسبقا🔓"
end
else 
data[tostring(target)]["settings"]["lock_all"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔓*lock All* _Has Been Disabled_🔓" 
else
return "🔓تم فتح الكل🔓"
end 
end
end

---------------lock Gif-------------------
local function lock_gif(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_gif = data[tostring(target)]["settings"]["lock_gif"] 
if lock_gif == "yes" then
if not lang then
 return "🔐*lock Gif* _Is Already Enabled_🔐"
elseif lang then
 return "🔐الصور المتحركه بالفعل مقفله🔐"
end
else
 data[tostring(target)]["settings"]["lock_gif"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then 
 return "🔓*lock Gif* _Has Been Enabled_🔓"
else
 return "🔓تم قفل ارسال الصور المتحركه🔓"
end
end
end

local function unlock_gif(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end
end 

local lock_gif = data[tostring(target)]["settings"]["lock_gif"]
 if lock_gif == "no" then
if not lang then
return "🔐*lock Gif* _Is Already Disabled_🔐" 
elseif lang then
return "🔐قفل الصور المتحركه معطل مسبقا🔐"
end
else 
data[tostring(target)]["settings"]["lock_gif"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔐*lock Gif* _Has Been Disabled_🔐" 
else
return "🔐تم فتح ارسال الصور المتحركه🔐"
end
end
end
---------------lock Game-------------------
local function lock_game(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_game = data[tostring(target)]["settings"]["lock_game"] 
if lock_game == "yes" then
if not lang then
 return "🔐*lock Game* _Is Already Enabled_🔐"
elseif lang then
 return "🔐قفل الالعاب مفعل مسبقا🔐"
end
else
 data[tostring(target)]["settings"]["lock_game"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*lock Game* _Has Been Enabled_🔐"
else
 return "🔐تم قفل الالعاب🔐"
end
end
end

local function unlock_game(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end 
end

local lock_game = data[tostring(target)]["settings"]["lock_game"]
 if lock_game == "no" then
if not lang then
return "🔓*lock Game* _Is Already Disabled_🔓" 
elseif lang then
return "🔓قفل الالعاب بالفعل معطل🔓"
end
else 
data[tostring(target)]["settings"]["lock_game"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "🔓*lock Game* _Has Been Disabled_🔓" 
else
return "🔓تم فتح قفل الالعاب🔓"
end
end
end
---------------lock Inline-------------------
local function lock_inline(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_inline = data[tostring(target)]["settings"]["lock_inline"] 
if lock_inline == "yes" then
if not lang then
 return "🔐*lock Inline* _Is Already Enabled_🔐"
elseif lang then
 return "🔐الاعلانات الشفافه بالفعل مقفله🔐"
end
else
 data[tostring(target)]["settings"]["lock_inline"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*lock Inline* _Has Been Enabled_🔐"
else
 return "🔐تم قفل الاعلانات الشفافه🔐"
end
end
end

local function unlock_inline(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end
end 

local lock_inline = data[tostring(target)]["settings"]["lock_inline"]
 if lock_inline == "no" then
if not lang then
return "🔓*lock Inline* _Is Already Disabled_🔓" 
elseif lang then
return "🔓قفل الشفافه بالفعل معطل🔓"
end
else 
data[tostring(target)]["settings"]["lock_inline"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔓*lock Inline* _Has Been Disabled_🔓" 
else
return "🔓تم الغاء قفل الشفافه🔓"
end
end
end
---------------lock Text-------------------
local function lock_text(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_text = data[tostring(target)]["settings"]["lock_text"] 
if lock_text == "yes" then
if not lang then
 return "��*lock Text* _Is Already Enabled_🔐"
elseif lang then
 return "🔐ارسال النص بالفعل مقفل🔐"
end
else
 data[tostring(target)]["settings"]["lock_text"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*lock Text* _Has Been Enabled_🔐"
else
 return "🔐تم قفل ارسال النص🔐"
end
end
end

local function unlock_text(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end 
end

local lock_text = data[tostring(target)]["settings"]["lock_text"]
 if lock_text == "no" then
if not lang then
return "🔓*lock Text* _Is Already Disabled_🔓"
elseif lang then
return "🔓قفل النص بالفعل معطل🔓" 
end
else 
data[tostring(target)]["settings"]["lock_text"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔓*lock Text* _Has Been Disabled_🔓" 
else
return "🔓قفل النص تم تعطيله🔓"
end
end
end
---------------lock photo-------------------
local function lock_photo(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "🔐_You're Not_ *Moderator*🔐"
else
 return "🔐انت لست ادمن🔐"
end
end

local lock_photo = data[tostring(target)]["settings"]["lock_photo"] 
if lock_photo == "yes" then
if not lang then
 return "🔐*lock Photo* _Is Already Enabled_🔐"
elseif lang then
 return "🔐قفل الصور مفغل سابقا🔐"
end
else
 data[tostring(target)]["settings"]["lock_photo"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*lock Photo* _Has Been Enabled_🔐"
else
 return "🔐تم قفل ارسال الصور🔐"
end
end
end

local function unlock_photo(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end
end
 
local lock_photo = data[tostring(target)]["settings"]["lock_photo"]
 if lock_photo == "no" then
if not lang then
return "🔓*lock Photo* _Is Already Disabled_🔓" 
elseif lang then
return "🔓قفل ارسال الصور غير مفعل🔓"
end
else 
data[tostring(target)]["settings"]["lock_photo"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔓*lock Photo* _Has Been Disabled_🔓" 
else
return "🔓تم فتح ارسال الصور🔓"
end
end
end
---------------lock Video-------------------
local function lock_video(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_video = data[tostring(target)]["settings"]["lock_video"] 
if lock_video == "yes" then
if not lang then
 return "🔐*lock Video* _Is Already Enabled_🔐"
elseif lang then
 return "🔐قفل الفديو مفعل مسبقا🔐"
end
else
 data[tostring(target)]["settings"]["lock_video"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then 
 return "🔐*lock Video* _Has Been Enabled_🔐"
else
 return "🔐تم قفل ارسال الفديو🔐"
end
end
end

local function unlock_video(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end
end 

local lock_video = data[tostring(target)]["settings"]["lock_video"]
 if lock_video == "no" then
if not lang then
return "🔓*lock Video* _Is Already Disabled_🔓" 
elseif lang then
return "🔓قفل الفديو معطل مسبقا🔓"
end
else 
data[tostring(target)]["settings"]["lock_video"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔓*lock Video* _Has Been Disabled_🔓" 
else
return "🔓تم تعطيل كتم الفديو🔓"
end
end
end
---------------lock Audio-------------------
local function lock_audio(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_audio = data[tostring(target)]["settings"]["lock_audio"] 
if lock_audio == "yes" then
if not lang then
 return "🔐*lock Audio* _Is Already Enabled_🔐"
elseif lang then
 return "🔐قفل البصمات مفعل🔐"
end
else
 data[tostring(target)]["settings"]["lock_audio"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*lock Audio* _Has Been Enabled_🔐"
else 
return "🔐تم تفعيل كتم البصمات🔐"
end
end
end

local function unlock_audio(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end
end 

local lock_audio = data[tostring(target)]["settings"]["lock_audio"]
 if lock_audio == "no" then
if not lang then
return "🔓*lock Audio* _Is Already Disabled_🔓" 
elseif lang then
return "🔓كتم البصمات معطل🔓"
end
else 
data[tostring(target)]["settings"]["lock_audio"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "🔓*lock Audio* _Has Been Disabled_������"
else
return "🔓تم تعطيل كتم البصمات🔓" 
end
end
end
---------------lock Voice-------------------
local function lock_voice(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_voice = data[tostring(target)]["settings"]["lock_voice"] 
if lock_voice == "yes" then
if not lang then
 return "🔐*lock Voice* _Is Already Enabled_🔐"
elseif lang then
 return "🔐كتم الاصوات مفعل🔐"
end
else
 data[tostring(target)]["settings"]["lock_voice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*lock Voice* _Has Been Enabled_🔐"
else
 return "🔐تم كتم الاصوات🔐"
end
end
end

local function unlock_voice(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end
end 

local lock_voice = data[tostring(target)]["settings"]["lock_voice"]
 if lock_voice == "no" then
if not lang then
return "🔓*lock Voice* _Is Already Disabled_🔓" 
elseif lang then
return "🔓الصوت ليس مقفلا اصلا🔓"
end
else 
data[tostring(target)]["settings"]["lock_voice"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "🔓*lock Voice* _Has Been Disabled_🔓" 
else
return "🔓تم فتح ارسال الصوت🔓"
end
end
end
---------------lock Sticker-------------------
local function lock_sticker(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_sticker = data[tostring(target)]["settings"]["lock_sticker"] 
if lock_sticker == "yes" then
if not lang then
 return "🔐*lock Sticker* _Is Already Enabled_🔐"
elseif lang then
 return "🔐الملسقات مقفوله فعلا🔐"
end
else
 data[tostring(target)]["settings"]["lock_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*lock Sticker* _Has Been Enabled_🔐"
else
 return "🔐تم قفل الملسقات🔐"
end
end
end

local function unlock_sticker(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end 
end

local lock_sticker = data[tostring(target)]["settings"]["lock_sticker"]
 if lock_sticker == "no" then
if not lang then
return "🔓*lock Sticker* _Is Already Disabled_🔓" 
elseif lang then
return "🔓قفل الملسقات بالفعل معطل🔓"
end
else 
data[tostring(target)]["settings"]["lock_sticker"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "🔓*lock Sticker* _Has Been Disabled_🔓"
else
return "🔓تم فتح الملسقات🔓"
end 
end
end
---------------lock Contact-------------------
local function lock_contact(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_contact = data[tostring(target)]["settings"]["lock_contact"] 
if lock_contact == "yes" then
if not lang then
 return "🔐*lock Contact* _Is Already Enabled_🔐"
elseif lang then
 return "🔐قفل الجهات مفعل سابقا🔐"
end
else
 data[tostring(target)]["settings"]["lock_contact"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*lock Contact* _Has Been Enabled_🔐"
else
 return "🔐تم تفعيل قفل الجهات🔐"
end
end
end

local function unlock_contact(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end
end 

local lock_contact = data[tostring(target)]["settings"]["lock_contact"]
 if lock_contact == "no" then
if not lang then
return "🔓*lock Contact* _Is Already Disabled_🔓" 
elseif lang then
return "🔓قفل الجهات بالفعل معطل🔓"
end
else 
data[tostring(target)]["settings"]["lock_contact"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔓*lock Contact* _Has Been Disabled_🔓" 
else
return "🔓قفل الجهات تم تعطيله🔓"
end
end
end
---------------lock Forward-------------------
local function lock_forward(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_forward = data[tostring(target)]["settings"]["lock_forward"] 
if lock_forward == "yes" then
if not lang then
 return "🔐*lock Forward* _Is Already Enabled_🔐"
elseif lang then
 return "🔐قفل التوجيه مفعل مسبقا🔐"
end
else
 data[tostring(target)]["settings"]["lock_forward"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*lock Forward* _Has Been Enabled_🔐"
else
 return "🔐تم قفل اعادة التوجيه🔐"
end
end
end

local function unlock_forward(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end
end 

local lock_forward = data[tostring(target)]["settings"]["lock_forward"]
 if lock_forward == "no" then
if not lang then
return "🔓*lock Forward* _Is Already Disabled_🔓"
elseif lang then
return "🔓قفل التوجيه بالفعل معطل🔓"
end 
else 
data[tostring(target)]["settings"]["lock_forward"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "🔓*lock Forward* _Has Been Disabled_🔓" 
else
return "🔓تم فتح التوجيه🔓"
end
end
end
---------------lock Location-------------------
local function lock_location(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_location = data[tostring(target)]["settings"]["lock_location"] 
if lock_location == "yes" then
if not lang then
 return "🔐*lock Location* _Is Already Enabled_🔐"
elseif lang then
 return "🔐قفل المواقع مفعل مسبقا🔐"
end
else
 data[tostring(target)]["settings"]["lock_location"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then
 return "🔐*lock Location* _Has Been Enabled_🔐"
else
 return "🔐تم قفل ارسال المواقع🔐"
end
end
end

local function unlock_location(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end
end 

local lock_location = data[tostring(target)]["settings"]["lock_location"]
 if lock_location == "no" then
if not lang then
return "🔓*lock Location* _Is Already Disabled_🔓" 
elseif lang then
return "🔓قفل المواقع بالفعل معطل🔓"
end
else 
data[tostring(target)]["settings"]["lock_location"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔓*lock Location* _Has Been Disabled_🔓" 
else
return "🔓قفل المواقع تم تعطيله🔓"
end
end
end
---------------lock Document-------------------
local function lock_document(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end
end

local lock_document = data[tostring(target)]["settings"]["lock_document"] 
if lock_document == "yes" then
if not lang then
 return "🔐*lock Document* _Is Already Enabled_🔐"
elseif lang then
 return "🔐قفل الفايلات مفعل مسبقا🔐"
end
else
 data[tostring(target)]["settings"]["lock_document"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*lock Document* _Has Been Enabled_🔐"
else
 return "🔐تم تفعيل منع الفايلات🔐"
end
end
end

local function unlock_document(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end
end 

local lock_document = data[tostring(target)]["settings"]["lock_document"]
 if lock_document == "no" then
if not lang then
return "🔓*lock Document* _Is Already Disabled_🔓" 
elseif lang then
return "🔓قفل القايلات بالفعل معطل🔓"
end
else 
data[tostring(target)]["settings"]["lock_document"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔓*lock Document* _Has Been Disabled_🔓" 
else
return "🔓تم تعطيل قفل الفايلات🔓"
end
end
end
---------------lock TgService-------------------
local function lock_tgservice(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "✖️انت لست ادمن✖️"
end
end

local lock_tgservice = data[tostring(target)]["settings"]["lock_tgservice"] 
if lock_tgservice == "yes" then
if not lang then
 return "🔐*lock TgService* _Is Already Enabled_🔐"
elseif lang then
 return "🔐قفل خدمات تلگرام فعال حتما🔐"
end
else
 data[tostring(target)]["settings"]["lock_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "🔐*lock TgService* _Has Been Enabled_🔐"
else
return "🔐قفل خدمات تلگرام فعال 🔐"
end
end
end

local function unlock_tgservice(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "✖️انت لست ادمن✖️"
end 
end

local lock_tgservice = data[tostring(target)]["settings"]["lock_tgservice"]
 if lock_tgservice == "no" then
if not lang then
return "🔓*lock TgService* _Is Already Disabled_🔓"
elseif lang then
return "🔓قفل خدمات تلگرام بالفعل غیرفعال 🔓"
end 
else 
data[tostring(target)]["settings"]["lock_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "🔓*lock TgService* _Has Been Disabled_🔓"
else
return "🔓قفل خدمات تلگرام غیرفعال 🔓"
end 
end
end


local function run(msg, matches)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
   local chat = msg.chat_id_
   local user = msg.sender_user_id_
if matches[1] == "ايدي" then
if not matches[2] and tonumber(msg.reply_to_message_id_) == 0 then
   if not lang then
return "*Chat ID :* _"..chat.."_\n*User ID :* _"..user.."_"
   else
return "*المجموعة :* _"..chat.."_\n*المستخدم :* _"..user.."_"
   end
end
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="id"})
  end
if matches[2] and tonumber(msg.reply_to_message_id_) == 0 then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="id"})
      end
   end
if matches[1] == "تثبيت" and is_owner(msg) then
tdcli.pinChannelMessage(msg.chat_id_, msg.reply_to_message_id_, 1)
if not lang then
return "*Message Has Been Pinned*"
else
return "تم تثبيت الرساله"
end
end
if matches[1] == 'الغاء تثبيت' and is_mod(msg) then
tdcli.unpinChannelMessage(msg.chat_id_)
if not lang then
return "*Pin message has been unpinned*"
else
return "تم الغاء تثبيت الرساله"
end
end
if matches[1] == "تفعيل" then
return modadd(msg)
end
if matches[1] == "تعطيل" then
return modrem(msg)
end
if matches[1] == "مشرف" and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="setowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="setowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="setowner"})
      end
   end
if matches[1] == "حذف مشرف" and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="remowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="remowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="remowner"})
      end
   end
if matches[1] == "مدير" and is_owner(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="promote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="promote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="promote"})
      end
   end
if matches[1] == "حذف مدير" and is_owner(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
 tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="demote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="demote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="demote"})
      end
   end

if matches[1] == "قفل" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "روابط" then
return lock_link(msg, data, target)
end
if matches[2] == "فواحش" then
return lock_fosh(msg, data, target)
end
if matches[2] == "تاك" then
return lock_tag(msg, data, target)
end
if matches[2] == "منشن" then
return lock_mention(msg, data, target)
end
if matches[2] == "العربيه" then
return lock_arabic(msg, data, target)
end
if matches[2] == "تعديل" then
return lock_edit(msg, data, target)
end
if matches[2] == "كلايش" then
return lock_spam(msg, data, target)
end
if matches[2] == "تكرار" then
return lock_flood(msg, data, target)
end
if matches[2] == "بوتات" then
return lock_bots(msg, data, target)
end
if matches[2] == "ماركد" then
return lock_markdown(msg, data, target)
end
if matches[2] == "ويب" then
return lock_webpage(msg, data, target)
end
end

if matches[1] == "فتح" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "روابط" then
return unlock_link(msg, data, target)
end
if matches[2] == "فواحش" then
return unlock_fosh(msg, data, target)
end
if matches[2] == "تاك" then
return unlock_tag(msg, data, target)
end
if matches[2] == "منشن" then
return unlock_mention(msg, data, target)
end
if matches[2] == "العربيه" then
return unlock_arabic(msg, data, target)
end
if matches[2] == "تعديل" then
return unlock_edit(msg, data, target)
end
if matches[2] == "كلايش" then
return unlock_spam(msg, data, target)
end
if matches[2] == "تكرار" then
return unlock_flood(msg, data, target)
end
if matches[2] == "بوتات" then
return unlock_bots(msg, data, target)
end
if matches[2] == "ماركد" then
return unlock_markdown(msg, data, target)
end
if matches[2] == "ويب" then
return unlock_webpage(msg, data, target)
end
end
if matches[1] == "قفل" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "الكل" then
return lock_all(msg, data, target)
end
if matches[2] == "متحركه" then
return lock_gif(msg, data, target)
end
if matches[2] == "نص" then
return lock_text(msg ,data, target)
end
if matches[2] == "صور" then
return lock_photo(msg ,data, target)
end
if matches[2] == "فديو" then
return lock_video(msg ,data, target)
end
if matches[2] == "بصمه" then
return lock_audio(msg ,data, target)
end
if matches[2] == "صوت" then
return lock_voice(msg ,data, target)
end
if matches[2] == "ملسق" then
return lock_sticker(msg ,data, target)
end
if matches[2] == "جهات" then
return lock_contact(msg ,data, target)
end
if matches[2] == "توجيه" then
return lock_forward(msg ,data, target)
end
if matches[2] == "مواقع" then
return lock_location(msg ,data, target)
end
if matches[2] == "فايل" then
return lock_document(msg ,data, target)
end
if matches[2] == "اعلانات" then
return lock_tgservice(msg ,data, target)
end
if matches[2] == "شفافه" then
return lock_inline(msg ,data, target)
end
if matches[2] == "العاب" then
return lock_game(msg ,data, target)
end
end

if matches[1] == "فتح" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "الكل" then
return unlock_all(msg, data, target)
end
if matches[2] == "متحركه" then
return unlock_gif(msg, data, target)
end
if matches[2] == "نص" then
return unlock_text(msg, data, target)
end
if matches[2] == "صور" then
return unlock_photo(msg ,data, target)
end
if matches[2] == "فديو" then
return unlock_video(msg ,data, target)
end
if matches[2] == "بصمه" then
return unlock_audio(msg ,data, target)
end
if matches[2] == "صوت" then
return unlock_voice(msg ,data, target)
end
if matches[2] == "ملسق" then
return unlock_sticker(msg ,data, target)
end
if matches[2] == "جهات" then
return unlock_contact(msg ,data, target)
end
if matches[2] == "توجيه" then
return unlock_forward(msg ,data, target)
end
if matches[2] == "مواقع" then
return unlock_location(msg ,data, target)
end
if matches[2] == "فايل" then
return unlock_document(msg ,data, target)
end
if matches[2] == "اعلانات" then
return unlock_tgservice(msg ,data, target)
end
if matches[2] == "شفافه" then
return unlock_inline(msg ,data, target)
end
if matches[2] == "العاب" then
return unlock_game(msg ,data, target)
end
end
if matches[1] == "معلومات" and is_mod(msg) and gp_type(msg.chat_id_) == "channel" then
local function group_info(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if not lang then
ginfo = "*📢Group Info :*📢\n👲_Admin Count :_ *"..data.administrator_count_.."*\n👥_Member Count :_ *"..data.member_count_.."*\n👿_Kicked Count :_ *"..data.kicked_count_.."*\n🆔_Group ID :_ *"..data.channel_.id_.."*\n\nchanall : @kenamch"
print(serpent.block(data))
elseif lang then
ginfo = "📢*معلومات saad7m المجموعه*📢\n👲_تعداد الادمن :_ *"..data.administrator_count_.."*\n👥_عدد الاعضاء:_ *"..data.member_count_.."*\n👿_عدد المطرودين :_ *"..data.kicked_count_.."*\n🆔_ايدي المجموعه :_ *"..data.channel_.id_.."*\n\n📢قناة البوت : @kenamch"
print(serpent.block(data))
end
        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.chat_id_, group_info, {chat_id=msg.chat_id_,msg_id=msg.id_})
end
		if matches[1] == 'ضع رابط' and is_owner(msg) then
			data[tostring(chat)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
      if not lang then
			return '_Please send the new group_ *link* _now_'
    else 
         return 'ارسل الرابط الجديد الان لطفا'
       end
		end

		if msg.content_.text_ then
   local is_link = msg.content_.text_:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.content_.text_:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(chat)]['settings']['linkgp'] = msg.content_.text_
				save_data(_config.moderation.data, data)
            if not lang then
				return "*Newlink* _has been set_"
           else
           return "تم حفظ الرابط بنجاح"
		 	end
       end
		end
    if matches[1] == 'رابط' and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "_First set a link for group with using_ /setlink"
     else
        return "يجب عليك اولا ارسال الامر ثم الرابط /setlink"
      end
      end
     if not lang then
       text = "<b>Group Link :</b>\n"..linkgp
     else
      text = "<b>رابط المجموعه:</b>\n"..linkgp
         end
        return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
     end
  if matches[1] == "ضع قوانين" and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
     if not lang then
    return "*Group rules* _has been set_"
   else 
  return "تم وضع قوانين المجموعه"
   end
  end
  if matches[1] == "قوانين" then
 if not data[tostring(chat)]['rules'] then
   if not lang then
     rules = "ℹ️ The Default Rules :\n1⃣ No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban.\n"
    elseif lang then
       rules = "ℹ️ القوانين الافتراضيه:\n1⃣ عدم تكرار الرسائل لتجنب الطرد.\n2⃣ الكلايش الطويله ممنوعه.\n3⃣ السب والشتم ممنوع.\n4⃣ الاعلانات والروابط ممنوعه.\n5⃣ الزحف ومضايقة الاعضاء طرد.\n➡️ احترم تحترم واخلاقك تعكس تربيتك.\n\nقناة البوت :  @kenamch"
 end
        else
     rules = "*Group Rules :*\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
if matches[1] == "جلب" and matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="res"})
  end
if matches[1] == "فحص" and matches[2] and is_mod(msg) then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="whois"})
  end
  if matches[1] == 'ضع تكرار' and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 50 then
				return "_Wrong number, range is_ *[1-50]*"
      end
			local flood_max = matches[2]
			data[tostring(chat)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
    return "_Group_ *flood* _تم تعيين التكرار للعدد :_ *[ "..matches[2].." ]*"
       end
		if matches[1]:lower() == 'حذف' and is_owner(msg) then
			if matches[2] == 'المدراء' then
				if next(data[tostring(chat)]['mods']) == nil then
            if not lang then
					return "_No_ *moderators* _in this group_"
             else
                return "لا يوجد مدراء حاليا بالمجموعه"
				end
            end
				for k,v in pairs(data[tostring(chat)]['mods']) do
					data[tostring(chat)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
				return "_All_ *moderators* _has been demoted_"
          else
            return "تم حذف جميع مدراء المجموعه"
			end
         end
			if matches[2] == 'الممنوعه' then
				if next(data[tostring(chat)]['filterlist']) == nil then
     if not lang then
					return "*Filtered words list* _is empty_"
         else
					return "_لا توجد كلمات ممنوعه_"
             end
				end
				for k,v in pairs(data[tostring(chat)]['filterlist']) do
					data[tostring(chat)]['filterlist'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
       if not lang then
				return "*Filtered words list* _has been cleaned_"
           else
				return "_تم حذف قائمة الكلمات الممنوعه_"
           end
			end
			if matches[2] == 'قوانین' then
				if not data[tostring(chat)]['rules'] then
            if not lang then
					return "_No_ *rules* _available_"
             else
               return "لا توجد قوانين لعرضها"
             end
				end
					data[tostring(chat)]['rules'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
				return "*Group rules* _has been cleaned_"
          else
            return "تم حذف قوانين المجموعه"
			end
       end
			if matches[2] == 'وصف' then
        if gp_type(chat) == "chat" then
				if not data[tostring(chat)]['about'] then
            if not lang then
					return "_No_ *description* _available_"
            else
              return "لا يوجد وصف للمجموعه حاليا"
          end
				end
					data[tostring(chat)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif gp_type(chat) == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
             if not lang then
				return "*Group description* _has been cleaned_"
           else
              return "تم حذف الوصف بنجاح"
             end
		   	end
        end
		if matches[1]:lower() == 'حذف' and is_admin(msg) then
			if matches[2] == 'المشرفين' then
				if next(data[tostring(chat)]['owners']) == nil then
             if not lang then
					return "_No_ *owners* _in this group_"
            else
                return "لا يوجد مشرفين في المجموعة"
            end
				end
				for k,v in pairs(data[tostring(chat)]['owners']) do
					data[tostring(chat)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
				return "_All_ *owners* _has been demoted_"
           else
            return "تم حذف جميع المشرفين"
          end
			end
     end
if matches[1] == "ضع اسم" and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if matches[1] == "ضع وصف" and matches[2] and is_mod(msg) then
     if gp_type(chat) == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif gp_type(chat) == "chat" then
    data[tostring(chat)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     if not lang then
    return "*Group description* _has been set_"
    else
     return "تم وضع وصف للمجموعه"
      end
  end
  if matches[1] == "الوصف" and gp_type(chat) == "chat" then
 if not data[tostring(chat)]['about'] then
     if not lang then
     about = "_No_ *description* _available_"
      elseif lang then
      about = "لا يوجد وصف حاليا للمجموعه"
       end
        else
     about = "*Group Description :*\n"..data[tostring(chat)]['about']
      end
    return about
  end
  if matches[1] == 'منع' and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if matches[1] == 'سماح' and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
  if matches[1] == 'الممنوعه' and is_mod(msg) then
    return filter_list(msg)
  end
if matches[1] == "اعدادات" then
return group_settings(msg, target)
end
if matches[1] == "المقفله" then
return locks(msg, target)
end
if matches[1] == "المدراء" then
return modlist(msg)
end
if matches[1] == "المشرفين" and is_owner(msg) then
return ownerlist(msg)
end

if matches[1] == "ضبط لغه" and is_owner(msg) then
   if matches[2] == "انكلش" then
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 redis:del(hash)
return "_Group Language Set To:_ EN"
  elseif matches[2] == "عربي" then
redis:set(hash, true)
return "*تم تحديث اللغه الى : العربيه*"
end
end




if matches[1] == "الاوامر" and is_mod(msg) then
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

if matches[1] == "متصل" and is_mod(msg) then
text5 = [[
✔️بالتاكيد متصل✔️
]]
return text5 
end
end

-----------------------------------------
return {
patterns ={
"^(متصل)$",
"^(ايدي)$",
"^(ايدي) (.*)$",
"^(تثبيت)$",
"^(الغاء تثبيت)$",
"^(معلومات)$",
"^(فحص)$",
"^(تفعيل)$",
"^(تعطيل)$",
"^(مشرف)$",
"^(مشرف) (.*)$",
"^(حذف مشرف)$",
"^(حذف مشرف) (.*)$",
"^(مدير)$",
"^(مدير) (.*)$",
"^(حذف مدير)$",
"^(حذف مدير) (.*)$",
"^(المدراء)$",
"^(المشرفين)$",
"^(قفل) (.*)$",
"^(فتح) (.*)$",
"^(اعدادات)$",
"^(المقفله)$",
"^(قفل) (.*)$",
"^(فتح) (.*)$",
"^(رابط)$",
"^(ضع رابط)$",
"^(قوانين)$",
"^(ضع قوانين) (.*)$",
"^(وصف)$",
"^(ضع وصف) (.*)$",
"^(ضع اسم) (.*)$",
"^(حذف) (.*)$",
"^(ضع تكرار) (%d+)$",
"^(جلب) (.*)$",
"^(فحص) (%d+)$",
"^(الاوامر)$",
"^(ضبط لغه) (.*)$",
"^(منع) (.*)$",
"^(سماح) (.*)$",
"^(الممنوعه)$",
"^([https?://w]*.?t.me/joinchat/%S+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$"


},
run=run,
pre_process = pre_process
}
-- @saad7m
-- @kenamch
