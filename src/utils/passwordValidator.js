const WEAK_PASSWORDS = new Set([
  '123456',
  '12345678',
  'password',
  'password123',
  'qwerty123',
  'abc12345',
  '11111111',
  '00000000'
])

const SPECIAL_CHARACTER_RE = /[^A-Za-z0-9]/

export function getPasswordChecks(password) {
  const candidate = String(password || '')

  return {
    minLength: candidate.length >= 8,
    uppercase: /[A-Z]/.test(candidate),
    lowercase: /[a-z]/.test(candidate),
    special: SPECIAL_CHARACTER_RE.test(candidate),
    weakPassword: WEAK_PASSWORDS.has(candidate.trim().toLowerCase())
  }
}

export function getPasswordStrength(password) {
  const candidate = String(password || '')
  const checks = getPasswordChecks(candidate)

  if (!candidate) {
    return { label: 'Weak', score: 0, tone: 'muted' }
  }

  let score = 0
  if (checks.minLength) score += 1
  if (candidate.length >= 12) score += 1
  if (checks.uppercase) score += 1
  if (checks.lowercase) score += 1
  if (checks.special) score += 1
  if (/\d/.test(candidate)) score += 1
  if (checks.weakPassword) score = Math.max(0, score - 2)

  if (score <= 2) {
    return { label: 'Weak', score, tone: 'negative' }
  }
  if (score <= 4) {
    return { label: 'Medium', score, tone: 'warning' }
  }
  if (score === 5) {
    return { label: 'Strong', score, tone: 'positive' }
  }

  return { label: 'Very Strong', score, tone: 'positive' }
}

export function validatePassword(password) {
  const candidate = String(password || '').trim()
  const checks = getPasswordChecks(candidate)

  if (!checks.minLength) {
    return 'Password must be at least 8 characters long.'
  }
  if (checks.weakPassword) {
    return 'Please choose a stronger password.'
  }
  if (!checks.uppercase) {
    return 'Password must include at least 1 uppercase letter.'
  }
  if (!checks.lowercase) {
    return 'Password must include at least 1 lowercase letter.'
  }
  if (!checks.special) {
    return 'Password must include at least 1 special symbol.'
  }

  return ''
}
