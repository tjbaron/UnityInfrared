using UnityEngine;
using System.Collections;

public class InfraredTemperatureRange : MonoBehaviour {

    private float lastMin = 0.0f;
    private float lastMax = 0.0f;

	public float minimumTemperature {
        get {
        	return _minimumTemperature;
        }
        set {
            if (lastMin == value) return;
            lastMin = value;
        	Shader.SetGlobalFloat("_AbsLowTemp", value);
        	_minimumTemperature = value;
            if (maximumTemperature < minimumTemperature) maximumTemperature = minimumTemperature;
        }
    }
	public float _minimumTemperature = 0.0f;

	public float maximumTemperature {
        get {
        	return _maximumTemperature;
        }
        set {
            if (lastMax == value) return;
            lastMax = value;
        	Shader.SetGlobalFloat("_AbsHighTemp", value);
        	_maximumTemperature = value;
            if (minimumTemperature > maximumTemperature) minimumTemperature = maximumTemperature;
        }
    }
	public float _maximumTemperature = 30.0f;

    public float normalWeight {
        get {
            return _normalWeight;
        }
        set {
            _normalWeight = value;
            Shader.SetGlobalFloat("_NormalWeight", value);
        }
    }
    public float _normalWeight = 0.1f;
}
