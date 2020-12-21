import 'package:at_client/src/preference/at_client_preference.dart';

class TestUtil {
  static AtClientPreference getPreferenceRemote() {
    var preference = AtClientPreference();
    preference.isLocalStoreRequired = false;
    preference.cramSecret = '<cram_secret>';
    preference.rootDomain = 'test.do-sf2.atsign.zone';
    preference.outboundConnectionTimeout = 60000;
    return preference;
  }
}
