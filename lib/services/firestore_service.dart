import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/movie.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Movie>> getMovies() {
    return _db.collection('movies').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Movie.fromFirestore(doc.id, doc.data());
      }).toList();
    });
  }

  Future<void> addMovie(Movie movie) async {
    await _db.collection('movies').add({
      'title': movie.title,
      'year': movie.year,
      'director': movie.director,
      'genre': movie.genre,
      'synopsis': movie.synopsis,
      'imageUrl': movie.imageUrl,
    });
  }

  Future<void> deleteMovie(String id) async {
    await _db.collection('movies').doc(id).delete();
  }
}
