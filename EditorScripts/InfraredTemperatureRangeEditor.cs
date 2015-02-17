using UnityEngine;
using UnityEditor;
 
[CustomEditor(typeof(InfraredTemperatureRange))]
public class InfraredTemperatureRangeEditor : Editor {
    public override void OnInspectorGUI () {
        base.OnInspectorGUI();

        if(target.GetType() == typeof(InfraredTemperatureRange)) {
            InfraredTemperatureRange temperatureRange = (InfraredTemperatureRange)target;
            temperatureRange.minimumTemperature = temperatureRange._minimumTemperature;
            temperatureRange.maximumTemperature = temperatureRange._maximumTemperature;
            temperatureRange.normalWeight = temperatureRange._normalWeight;
        }
    }
}