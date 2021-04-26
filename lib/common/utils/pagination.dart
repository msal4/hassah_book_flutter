Map<String, dynamic> updatePaginatedResponse(Map<String, dynamic> oldData, Map<String, dynamic> newData, String key) {
  newData[key]["items"] = [...oldData[key]["items"], ...newData[key]["items"]];
  return newData;
}
