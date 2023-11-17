
# Note to self-host user

When updating the app, please make sure you are using the latest config file, as some releases may contain new features that require certain configuration parameters. If those parameters are missing, the app might not be able to start correctly.

# What is this app?
Open Poll+ is free and open source app for create a poll in Slack.\
Open Poll+ เป็นแอปฟรีและ Open source ใช้สำหรับสร้างโพลหรือคำถามต่างๆใน Slack.\
Open Poll+ est une application gratuite et open source pour créer des sondages dans Slack.\
Open Poll+ ist eine kostenlose und Open-Source-App zum Erstellen von Umfragen in Slack.\
Open Poll+ es una aplicación gratuita y de código abierto para crear encuestas en Slack.\
Open Poll+ ist eine kostenlose und Open-Source-App zum Erstellen von Umfragen in Slack.\
Open Poll+は、Slackで投票を作成するための無料かつオープンソースのアプリです。\
Open Poll+는 Slack에서 설문 조사를 작성하기 위한 무료 및 오픈 소스 앱입니다.\
Open Poll+ - бесплатное приложение с открытым исходным кодом для создания опросов в Slack.\
Open Poll+ هو تطبيق مجاني ومفتوح المصدر لإنشاء استطلاعات في Slack.\
Open Poll+是用于在Slack中创建调查的免费开源应用程序。

# About this fork 

I have made some changes to make it more customizable, such as:
- Allowing choices to be added by others
- True anonymous voting (Poller can't see users' votes if this mode is ON): Default ON
- Supporting Slack's Enterprise Grid and Slack Connect
- Customizable UI (Order, Show/Hide Elements you don't want to make it cleaner)
- UI Language, multiple language support (Please feel free to report any mistranslations)
- Separate configuration for each Slack team
- Better error handling to prevent crashes on the server

(Please see detail below)

### If I just want to use it without self-host?
You can use "Add to slack" button [on this site](https://siamhos.com/openpollplus/index_plus.html)
or visit [Slack app directory](https://slack.com/apps/A04EQUT9X1C) 

PLEASE NOTE: The link above will run the latest code on my development server. You can use it for free, but it may contain bugs or may be down for maintenance without any notice. If you find any bugs, please feel free to report them.

After adding the app to Slack, please use the `/poll config` command to configure which options you want to enable or disable on your Slack team.

**If you have trouble adding app to Slack or creating poll, try to uninstall it first then reinstall as you might have old version that not compatible with current version(version before App was published to Slack app dir.)** 

If you didn't use any of these Feature you might want to use original App here [GitLab](https://gitlab.com/openpollslack/openpollslack).

## Team config (Override Server config)

If some of your team would like to using different config than what is on default.json you can use `/poll config` .
- this command only work on user who install app to Slack only
- If app was re-add to workspace all Override config will be removed
- 
## Self-host: Server config (config/default.json)
- `mongo_url`: the url to connect to your mongo database
- `mongo_db_name`: your mongo database name (Main DB)
- `app_lang` for translation (Please put language file in language folder), Translate some text to Thai (th-ภาษาไทย)
- `app_lang_user_selectable` if set to `true`; Let user who create poll (Via Modal) select language of poll UI 
- `use_response_url` if set to `true`; app will respond to request using `response_url` instead of using `app.client.chat.post`
  so user will be able to create poll in private channel without adding bot to that channel (using /command or Modal that called by /command, but not via shortcut), But it might get timeout if user not response after Modal was created (click create poll) within slack time limit(30 minutes).
- `create_via_cmd_only`  if set to `true` (available only if `use_response_url` is enabled) ; User will NOT able to create Poll using Shortcut; it will show `modal_ch_via_cmd_only` string to ask user to create poll via /command instead.
- `menu_at_the_end` if set to `true`; Rearrange Menu to the end of poll so no more big menu button between question and answer when using smartphone
- `add_number_emoji_to_choice` and `add_number_emoji_to_choice_btn`  if set to `true`; Number emoji (customizeable) will show in the vote option text / button
- `compact_ui` if set to `true`; Choice text will compact to voter name
- `show_divider` if set to `false`; Poll will be more compact (divider between choice will be removed)
- `show_help_link` if set to `false`; help link will be removed from poll
- `show_command_info` if set to `false`; command that use to create poll will be removed (You still can see command in Menu)
- `true_anonymous` if set to `true`; Poller will no longer see who voted which options if poll is anonymous, If this mode is disabled; `info_anonymous_notice` will show to let users know that poller can still see there votes
- `delete_data_on_poll_delete` if set to `true`; When poller request to delete the poll, all data in database that refer to that poll will be deleted. If you want to disable it please make sure if compliance with your policy.
- `log_level_app` valid options are: `debug` `verbose` `info` `warn` `error`
- `log_level_bolt` valid options are: `debug` `verbose` `info` `warn` `error`
- `log_to_file` valid options are: `true` `false`
- `log_dir` folder of log file
- `schedule_limit_hrs` schedule will deny to re-run if schedule jobs is shorter than this number (hours)



Usage:
```
/poll config read
/poll config write app_lang [zh_tw/zh_cn/th/ru/kr/jp/fr/es/en/de/(or language file)]
/poll config write app_lang_user_selectable [true/false]
/poll config write menu_at_the_end [true/false]
/poll config write create_via_cmd_only [true/false]
/poll config write compact_ui [true/false]
/poll config write show_divider [true/false]
/poll config write show_help_link [true/false]
/poll config write show_command_info [true/false]
/poll config write true_anonymous [true/false]
/poll config write add_number_emoji_to_choice [true/false]
/poll config write add_number_emoji_to_choice_btn [true/false]
/poll config write delete_data_on_poll_delete [true/false]
```

## Example

- if `response_url` is not enable or not in use, user will get feedback if poll can create in that channel or not (required `channels:read`,`groups:read`,`mpim:read` Permissions)

  ![Alt text](./assets/poll-ch-check-feedback.png?raw=true "poll-ch-check-feedback")
- User language selectable

  ![Alt text](./assets/poll-lang-select.png?raw=true "poll-lang-select")
- User add choice

  ![Alt text](./assets/poll-add-choice-en.png?raw=true "User add choice")
- UI Config

  ![Alt text](./assets/UI-compare.png?raw=true "UI-compare")
  ![Alt text](./assets/UI-compare-mobile.png?raw=true "UI-compare-mobile")
  ![Alt text](./assets/UI-menu-location.png?raw=true "UI-menu-location")
- Emoji On/Off

 ![Alt text](./assets/UI-emoji.png?raw=true "UI-Emoji")

- You also can add notice to user when anonymous was used (since creator still can see their votes) by add text you want in `info_anonymous_notice` of language file 

 ![Alt text](./assets/poll-anonymous-note.png?raw=true "poll-anonymous-note")
## Additional Permissions

`channels:read`,`groups:read`,`mpim:read` : to check if bot in selected channel (if not using `response_url`)
## Command usages
### Allow choices add by others
```
/poll add-choice "What's your favourite color ?" "Red" "Green" "Blue" "Yellow"
```

### Change poll language for current poll only
```
/poll lang th "What's your favourite color ?" "Red" "Green" "Blue" "Yellow"
```

# Open source poll for Slack

Welcome to the open source poll for Slack.  
This repository is hosted on [GitLab](https://gitlab.com/openpollslack/openpollslack). [Github repository](https://github.com/KazuAlex/openpollslack) is only a mirror.  
But feel free to open new issues on both.  

## Important update

If you have an error when submitting poll, please use the "Add to slack" button [on site](https://siamhos.com/openpollplus/index_plus.html) to re-authorize the bot on your workspace

### Migrate to v3

To upgrade to v3, you need to have a mongo database.  
Setup your `config/default.json` with new database url and database name:
- `mongo_url`: the url to connect to your mongo database
- `mongo_db_name`: your mongo database name

After that, migrate your old database to the mongo with the script:  
At the root directory, run `./scripts/migrate-v3.sh [MONGO_URL] [MONGO_DB_NAME]`  
Replace `[MONGO_URL]` by the same `mongo_url` and `[MONGO_DB_NAME]` with the same `mongo_db_name` set in your `config/default.json`.  
As an example, with the default data from `config/default.json.dist`, the command line to migrate is:
```
./scripts/migrate-v3.sh mongodb://localhost:27017 open_poll
```

## License

The code is under GNU GPL license. So, you are free to modify the code and redistribute it under same license.  
  
Remember the four freedoms of the GPL :  
> the freedom to use the software for any purpose,
> * the freedom to change the software to suit your needs,
> * the freedom to share the software with your friends and neighbors, and
> * the freedom to share the changes you make.

## Command usages

### Simple poll
```
/poll "What's your favourite color ?" "Red" "Green" "Blue" "Yellow"
```
### Anonymous poll
```
/poll anonymous "What's your favourite color ?" "Red" "Green" "Blue" "Yellow"
```
### Limited choice poll
```
/poll limit 2 "What's your favourite color ?" "Red" "Green" "Blue" "Yellow"
```
### Hidden poll votes
```
/poll hidden "What's your favourite color ?" "Red" "Green" "Blue" "Yellow"
```
### Anonymous limited choice poll
```
/poll anonymous limit 2 "What's your favourite color ?" "Red" "Green" "Blue" "Yellow"
```

### Allow choices add by others
```
/poll add-choice "What's your favourite color ?" "Red" "Green" "Blue" "Yellow"
```

### Allow choices add by others with Limited and Anonymous
```
/poll add-choice anonymous limit 2 "What's your favourite color ?" "Red" "Green" "Blue" "Yellow"
```

### Change poll language for current poll only
```
/poll lang th "What's your favourite color ?" "Red" "Green" "Blue" "Yellow"
```
  
For both question and choices, feel free to use Slack's emoji, `*bold*` `~strike~` `_italics_` and `` `code` ``  

## Self hosted installation

- [self_host.md](self_host.md)
- [webpage.md](webpage.md)
- [apache-ssl.md](apache-ssl.md)
## Support me

To support or thank me, you can contact me. I would be happy to provide you my PayPal address.
