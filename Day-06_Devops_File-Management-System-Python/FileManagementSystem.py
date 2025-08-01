import os

try:
    def cwd():
        s=os.getcwd()
        print(s)

    def ls():
        files = os.listdir(cwd())
        print(files)
    
    def cd(new_dir):

        if new_dir==[".."]:
            s=os.getcwd()
            s=s[0:s.rfind("\\")]
            os.chdir(s)
        else:
            s = os.path.join(os.getcwd(), *new_dir)
            if os.path.exists(s):
                print("directory changed")
                os.chdir(s)

    def create(name, content):
        s=""
        for i in content:
            s+=i+" " 
        with open(name, 'w') as f:
            f.write(s)

    def delete(name):
        if os.path.exists(name):
            os.remove(name)
        else:
            print("The file does not exist")

    def read(name):
        with open(name, "r") as f:
            content = f.read()
            print(content)
except Exception as e:
    print("An error occurred:", e)

while True:
    cmd=input("Enter the command: ")
    l=cmd.split(" ")

    match l[0]:
        case "touch":
            create(l[1][1:-1],l[2:])
        case "cwd":
            cwd()
        case "rm":
            delete(l[1])
        case "ls":
            ls()
        case "cd":
            cd(l[1:])
        case "exit":
            break
    
    