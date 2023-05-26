import '../database.dart';

class FeedInterviewTable extends SupabaseTable<FeedInterviewRow> {
  @override
  String get tableName => 'feed_interview';

  @override
  FeedInterviewRow createRow(Map<String, dynamic> data) =>
      FeedInterviewRow(data);
}

class FeedInterviewRow extends SupabaseDataRow {
  FeedInterviewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FeedInterviewTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get interviewHero => getField<String>('interview_hero');
  set interviewHero(String? value) => setField<String>('interview_hero', value);

  String? get mainContent => getField<String>('main_content');
  set mainContent(String? value) => setField<String>('main_content', value);

  String? get speciality => getField<String>('speciality');
  set speciality(String? value) => setField<String>('speciality', value);

  String? get quote => getField<String>('quote');
  set quote(String? value) => setField<String>('quote', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get additionalContent => getField<String>('additional_content');
  set additionalContent(String? value) =>
      setField<String>('additional_content', value);

  String? get interviewUrl => getField<String>('interview_url');
  set interviewUrl(String? value) => setField<String>('interview_url', value);
}
