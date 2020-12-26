import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/services/admob.dart';
import 'package:iiitb_hogwarts/widgets/iiitb_hogwarts_card.dart';

class FeedbackScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    String _feedback;

    Widget feedback() {
      return CustomCard(
        title: 'Your feedback',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Your feedback',
                      contentPadding:
                      EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color(0xFFFFFFFF).withOpacity(0.40),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none)),
                  validator: (value) {
                    if (value.isEmpty || value.trim().isEmpty)
                      return 'Cannot send empty feedback!';
                    return null;
                  },
                  onSaved: (value) => _feedback=value.trim()),
            ),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: MaterialButton(
                color: Color(0xFFDF267C),
                child: Text('SEND EMAIL'),
                onPressed: () {
                  if(!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                  print('{Feedback: $_feedback}');
                  _formKey.currentState.reset();
                },
              ),
            )
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            feedback(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AdmobBanner(
                adUnitId: AdmobAds().getBannerId(),
                adSize: AdmobBannerSize.LARGE_BANNER,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
