using UnityEngine;
using UnityEditor;
 
[CustomEditor(typeof(TemperatureFade))]
public class TemperatureFadeEditor : Editor {
    public override void OnInspectorGUI () {
        base.OnInspectorGUI();

        if(target.GetType() == typeof(TemperatureFade)) {
            TemperatureFade tf = (TemperatureFade)target;
            tf.goalLow = tf._goalLow;
            tf.goalHigh = tf._goalHigh;
        }
    }
}