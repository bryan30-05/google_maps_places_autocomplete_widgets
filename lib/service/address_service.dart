import '/api/place_api_provider.dart';
import '/model/place.dart';
import '/model/suggestion.dart';

class AddressService {
  AddressService(this.sessionToken, this.mapsApiKey, this.componentCountry,
      this.language, this.proxy, this.apiKeyOnProxy) {
    apiClient =
        PlaceApiProvider(sessionToken, mapsApiKey, componentCountry, language, proxy, apiKeyOnProxy);
  }

  final String sessionToken;
  final String mapsApiKey;
  final String? componentCountry;
  final String? language;
  final Uri? proxy;
  late PlaceApiProvider apiClient;
  bool apiKeyOnProxy = false;

  Future<List<Suggestion>> search(String query,
      {bool includeFullSuggestionDetails = false,
      bool postalCodeLookup = false}) async {
    return await apiClient.fetchSuggestions(query,
        includeFullSuggestionDetails: includeFullSuggestionDetails,
        postalCodeLookup: postalCodeLookup);
  }

  Future<Place> getPlaceDetail(String placeId) async {
    Place placeDetails = await apiClient.getPlaceDetailFromId(placeId);
    return placeDetails;
  }
}
