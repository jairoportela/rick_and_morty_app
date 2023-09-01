enum ApiEndpoints {
  character('character'),
  episode('episode'),
  location('location');

  const ApiEndpoints(this.path);
  final String path;
}
