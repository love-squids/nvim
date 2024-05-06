@echo off
SETLOCAL

doskey gs=git status
doskey gl=git log
doskey gd=git diff
doskey gds=git diff --staged
doskey gdw=git difftool --dir-diff
doskey gds=git difftool --dir-diff --staged
doskey gr=git remote
doskey gb=git branch --sort=-committerdate

doskey gc.=git checkout .
doskey gcb=git checkout -b $*
doskey gc=git checkout $*
doskey gcma=git checkout main
doskey gcde=git checkout develop
doskey gpod=git pull origin develop
doskey gpom=git pull origin main
doskey gf=git fetch
doskey gpl=git pull
doskey gps=git push
doskey gcm=git commit -m "$*"
doskey gca=git add . ^& git commit -m "$*"
doskey frb=flutter pub run build_runner watch --delete-conflicting-outputs
doskey fc=flutter clean
doskey fpg=flutter pub get
doskey fr=flutter run lib/main.dart --flavor=development
doskey frp=flutter run lib/main.dart --flavor=production
doskey fcr=flutter clean ^& flutter pub get ^& flutter run lib/main.dart --flavor=development
doskey fbbundle=flutter build appbundle --flavor production -t lib/main.dart
doskey fa=flutter analyze
doskey faw=flutter analyze --watch
doskey fl=dart format .
doskey ft=flutter test $*
doskey fla=dart format . ^& dart fix --apply ^& flutter analyze
doskey flat=dart format . ^& dart fix --apply ^& flutter analyze ^& flutter test
doskey ffr=c:\w\tools\filter\bin\Release\net8.0\filter.exe -c C:\w\tools\flutter_windows_3.16.4\flutter\bin\flutter.bat -a run lib/main.dart --flavor=development -d "P2129O002250"
doskey ffr2=c:\w\tools\filter\bin\Release\net8.0\filter.exe -c C:\w\tools\flutter_windows_3.16.4\flutter\bin\flutter.bat -a run lib/main.dart --flavor=development -d "ZL7322PNJM"

doskey rd=pnpm run dev
doskey rc=pnpm run checkformat
doskey rl=pnpm run lint
doskey rf=pnpm run format
doskey rb=pnpm run build

doskey e1=C:\Users\radu\AppData\Local\Android\Sdk\tools\emulator.exe -avd Medium_Phone_API_24
doskey e2=C:\Users\radu\AppData\Local\Android\Sdk\tools\emulator.exe -avd Small_Phone_API_33

cd "c:\w\hupu"

cmd.exe /k 'C:\\Program Files\\Tabby\\resources\\extras\\clink\\clink_x64.exe inject'
