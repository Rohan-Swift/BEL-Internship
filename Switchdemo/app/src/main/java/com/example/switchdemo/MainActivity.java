package com.example.switchdemo;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.SwitchCompat;

import android.os.Bundle;
import android.widget.CompoundButton;
import android.widget.Switch;
import android.widget.TextView;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class MainActivity extends AppCompatActivity {

    SwitchCompat sw1, sw2;
    FirebaseDatabase db= FirebaseDatabase.getInstance();
    DatabaseReference s1= db.getReference("Switch").child("s1");
    DatabaseReference s2= db.getReference("Switch").child("s2");

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        sw1= findViewById(R.id.switch1);
        sw2= findViewById(R.id.switch2);


        sw1.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
                if(sw1.isChecked())
                    s1.setValue(1);
                else
                    s1.setValue(0);
            }
        });

        sw2.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
                if(sw2.isChecked())
                    s2.setValue(1);
                else
                    s2.setValue(0);
            }
        });
    }
}