import asyncio
import time

from websockets.sync.client import connect

class ws:
    def __init__(self):
        port = 5555
        host = "localhost"
        connection_string = f"ws://{host}:{port}"
        self.connection = connect(connection_string)
        
        # Initialize VehicleData attributes
        self.vehicle_data = {
            'theme': None,
            'doorDrvr': False,
            'doorPsgr': False,
            'switchTurnL': False,
            'switchTurnR': False,
            'qsrIcons': False,
            'gear': False,
            'lights': False,
            'driveMode': 'SPORT',
            'speed': 0,
            'fuel': 0,
            'battery': 0,
            'adasRot': 0,
            'units': None
        }

    def __send_msg(self, msg: str):
        self.connection.send(msg)

    def process_message(self, data: str):
        # Split the message into command and value
        parts = data.split(':')
        if len(parts) != 2:
            print(f"Invalid message format: {data}")
            return

        command, value = parts[0], parts[1]

        # Process different commands
        if command == "theme":
            self.vehicle_data['theme'] = value
        elif command == "doorLeft":
            self.vehicle_data['doorDrvr'] = (value.lower() == "true")
        elif command == "doorRight":
            self.vehicle_data['doorPsgr'] = (value.lower() == "true")
        elif command == "turnSignalLeft":
            self.vehicle_data['switchTurnL'] = (value.lower() == "true")
        elif command == "turnSignalRight":
            self.vehicle_data['switchTurnR'] = (value.lower() == "true")
        elif command == "qsrIcons":
            self.vehicle_data['qsrIcons'] = (value.lower() == "true")
        elif command == "gear":
            self.vehicle_data['gear'] = (value.lower() == "true")
        elif command == "lamps":
            self.vehicle_data['lights'] = (value.lower() == "true")
        elif command == "adasEnabled":
            self.vehicle_data['driveMode'] = "ADAS" if value.lower() == "true" else "SPORT"
        elif command == "speed":
            self.vehicle_data['speed'] = float(value)
        elif command == "fuel":
            self.vehicle_data['fuel'] = float(value)
        elif command == "battery":
            self.vehicle_data['battery'] = float(value)
        elif command == "adasRot":
            self.vehicle_data['adasRot'] = float(value)
        elif command == "units":
            self.vehicle_data['units'] = value
        else:
            print(f"Unknown command: {command}")

    def send(self, command: str, value):
        """
        Send a message in the format "command:value"
        Handles type conversion automatically
        """
        # Convert boolean values to lowercase string
        if isinstance(value, bool):
            value = str(value).lower()
        
        # Convert to string and send
        msg = f"{command}:{value}"
        print(msg)
        self.__send_msg(msg)

    def send_test_name(self, test_name: str):
        """
        Send the current test name to be displayed in the cluster
        """
        self.send("testName", test_name)

    def close(self):
        self.connection.close_socket()
