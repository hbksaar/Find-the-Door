using System.Collections;
using System.Collections.Generic;
using UnityEngine;



public class ViveLaserPointer : MonoBehaviour {
  
    public static string sendMeToP5Bitch;

    public Transform controller;

    public enum AxisType
    {
        XAxis,
        ZAxis
    }

    public Color color;
    public float thickness = 0.002f;
    public AxisType facingAxis = AxisType.XAxis;
    public float length = 100f;
    public bool showCursor = true;

    GameObject holder;

    private GameObject hitPrimitive;

    // Use this for initialization
    void Start()
    {
        Material newMaterial = new Material(Shader.Find("Unlit/Color"));
        newMaterial.SetColor("_Color", color);

        holder = new GameObject();
        holder.transform.parent = controller.transform;
        holder.transform.localPosition = Vector3.zero;

        hitPrimitive = GameObject.CreatePrimitive(PrimitiveType.Sphere);
        hitPrimitive.transform.localScale = new Vector3(0.2f,0.2f,0.2f);
        Destroy(hitPrimitive.GetComponent<Collider>());
    }

    void Update()
    {
        Ray raycast = new Ray(controller.transform.position, controller.transform.forward);

        Debug.DrawRay(raycast.origin, raycast.direction * 10000.0f, Color.red);

        RaycastHit hitObject;
        bool rayHit = Physics.Raycast(raycast, out hitObject);

        if (rayHit)
        {
            hitPrimitive.transform.position = hitObject.point;
            sendMeToP5Bitch = hitObject.point.ToString();
        }
    }
}
