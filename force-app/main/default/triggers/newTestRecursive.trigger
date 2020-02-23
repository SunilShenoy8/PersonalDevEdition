trigger newTestRecursive on Account (before insert) 
{
    newRecursiveTriggerClass.handle();
}