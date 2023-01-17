

interface HabitProps {
    completed: number
}

export const Habit = (props: HabitProps) => {
    return (
        <p className="text-white rounded m-2 w-10 text-center flex items-center justify-center h-10 bg-zinc-900">{props.completed}</p>
    )
}