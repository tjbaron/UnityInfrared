using UnityEngine;
using System.Collections;

public class TemperatureFade : MonoBehaviour {
    private AnimationCurve lowCurve;
    private AnimationCurve highCurve;

    private float lastGoalLow = 10.0f;
    public float _goalLow = 10.0f;

    public float goalLow {
        get {
            return _goalLow;
        }
        set {
            if (lastGoalLow == value) return;
            _goalLow = value;
            lastGoalLow = value;
            updateCurves();
        }
    }

    private float lastGoalHigh = 20.0f;
    public float _goalHigh = 20.0f;

	public float goalHigh {
        get {
            return _goalHigh;
        }
        set {
            if (lastGoalHigh == value) return;
            _goalHigh = value;
            lastGoalHigh = value;
            updateCurves();
        }
    }

    public float fadeTime = 10.0f;

	// Use this for initialization
	void Start () {
        updateCurves();
	}
	
	// Update is called once per frame
	void Update () {
        float vl = lowCurve.Evaluate(Time.time);
        float vh = highCurve.Evaluate(Time.time);
        renderer.material.SetFloat("_LowTemp", vl);
        renderer.material.SetFloat("_HighTemp", vh);
	}

    void updateCurves() {
        lowCurve = AnimationCurve.EaseInOut(Time.time, renderer.material.GetFloat("_LowTemp"), Time.time+fadeTime, _goalLow);
        highCurve = AnimationCurve.EaseInOut(Time.time, renderer.material.GetFloat("_HighTemp"), Time.time+fadeTime, _goalHigh);
    }

}
