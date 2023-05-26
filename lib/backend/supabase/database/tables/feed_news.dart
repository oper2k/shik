import '../database.dart';

class FeedNewsTable extends SupabaseTable<FeedNewsRow> {
  @override
  String get tableName => 'feed_news';

  @override
  FeedNewsRow createRow(Map<String, dynamic> data) => FeedNewsRow(data);
}

class FeedNewsRow extends SupabaseDataRow {
  FeedNewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FeedNewsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  String? get contentImageUrl => getField<String>('content_image_url');
  set contentImageUrl(String? value) =>
      setField<String>('content_image_url', value);
}
