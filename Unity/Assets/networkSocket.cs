using UnityEngine;
using System.Collections;
using System;
using System.IO;
using System.Net.Sockets;

public class networkSocket : MonoBehaviour
{
    public String host = "localhost";
    public Int32 port = 50000;
    internal Boolean socket_ready = false;
    internal String input_buffer = "";
    TcpClient tcp_socket;
    NetworkStream net_stream;
    StreamWriter socket_writer;

    void Update()
    {
        try{
        String LaserPointPos = ViveLaserPointer.sendMeToP5Bitch;
        writeSocket(LaserPointPos);
        if (!socket_ready)
        {
          closeSocket();
          setupSocket();
        }
      } catch (Exception e) {
        socket_ready = false;
        Debug.Log(e + ", trying to reconnect..");
      }
    }

    void Awake()
    {
        Application.runInBackground = true;
        setupSocket();
    }

    void OnApplicationQuit()
    {
        closeSocket();
    }

    public void setupSocket()
    {
        try
        {
            tcp_socket = new TcpClient(host, port);
            net_stream = tcp_socket.GetStream();
            socket_writer = new StreamWriter(net_stream);
            socket_ready = true;
        }
        catch (Exception e)
        {
            Debug.Log("Socket error: " + e);
        }
    }

    public void writeSocket(string line)
    {
        if (!socket_ready)
            return;

        line = line + "\r\n";
        socket_writer.Write(line);
        socket_writer.Flush();
    }
    public void closeSocket()
    {
        if (!socket_ready)
            return;
        socket_writer.Close();
        tcp_socket.Close();
        socket_ready = false;
    }
}
