-- TABLE TO HOLD TASKS
local tasks = {}

-- FUNCTION TO ADD A TASK
local function addTask(taskName)
  local task = {
    name = taskName,
    completed = false
  }
  table.insert(tasks, task)
  print("Task added: " .. taskName)
end

-- FUNCTION TO VIEW TASKS
local function viewTasks()
  if #tasks == 0 then
    print("No tasks available.")
  else
    print("Tasks:")
    for i, task in ipairs(tasks) do
      local status = task.completed and "✔️" or "❌"
      print(string.format("%d. %s [%s]", i, task.name, status))
    end
  end
end

-- FUNCTION TO COMPLETE A TASK
local function completeTask(taskIndex)
  if tasks[taskIndex] then
    tasks[taskIndex].completed = true
    print("Task completed: " .. tasks[taskIndex].name)
  else
    print("Task not found.")
  end
end

-- MAIN PROGRAM LOOP
local function main()
  while true do
    print("\nSimple Task Manager")
    print("1. Add Task")
    print("2. View Tasks")
    print("3. Complete Task")
    print("4. Exit")
    io.write("Choose an option: ")
    
    local choice = io.read()
    
    if choice == "1" then
      io.write("Enter task name: ")
      local taskName = io.read()
      addTask(taskName)
    elseif choice == "2" then
      viewTasks()
    elseif choice == "3" then
      io.write("Enter task number to complete: ")
      local taskIndex = tonumber(io.read())
      completeTask(taskIndex)
    elseif choice == "4" then
      print("Exiting...")
      break
    else
      print("Invalid choice. Please try again.")
    end
  end
end

-- RUN THE MAIN FUNCTION
main()