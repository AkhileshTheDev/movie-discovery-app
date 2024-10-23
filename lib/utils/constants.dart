// ignore_for_file: constant_identifier_names

class Constants {

  static const bool isdebug=true;
  static  trimstring(String? imagePath,String? replaceword,String? byreplace) {
   if(isdebug){
     return imagePath?.replaceAll(replaceword!, byreplace!);
   }else{
     return imagePath;
   }

  }
}
