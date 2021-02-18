/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PackegeReminder;

import java.util.Timer;
import java.util.TimerTask;

/**
 *
 * @author Lenovo
 */
public class Reminder {
    Timer timer;
    public String Status=null;
    public  String Return(int seconds) {
        timer = new Timer();
        timer.schedule(new RemindTask(), seconds*1000);
        return Status;
	}

    public class RemindTask extends TimerTask {
        public void run() {
           
           out.print("Time's up!");
            timer.cancel(); //Terminate the timer thread

        }

    }
}

